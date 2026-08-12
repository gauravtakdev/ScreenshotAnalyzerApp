//
//  ScreenshotAnalyzerService.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import Foundation
import UIKit
import FoundationModels

final class ScreenshotAnalyzerService {

    private let ocrService = OCRService()

    @available(iOS 26.0, *)
    private let foundationModelService = FoundationModelService()

    func analyze(
        image: UIImage
    ) async throws -> ScreenshotAnalysis {

        // Step 1: OCR
        let extractedText = try await ocrService.recognizeText(
            from: image
        )

        // Step 2: AI analysis using OCR text
        let aiResponse = try await foundationModelService.analyzeScreenshot(
            extractedText: extractedText
        )

        // Step 3: Convert AI response into our model
        return parseResponse(
            aiResponse,
            extractedText: extractedText
        )
    }

    private func parseResponse(
        _ response: String,
        extractedText: String
    ) -> ScreenshotAnalysis {

        let title = extractSection(
            "TITLE:",
            from: response
        ) ?? "Screenshot Analysis"

        let category = extractSection(
            "CATEGORY:",
            from: response
        ) ?? "Unknown"

        let summary = extractSection(
            "SUMMARY:",
            from: response
        ) ?? response

        let keyPoints = extractList(
            "KEY_POINTS:",
            from: response
        )

        let issues = extractList(
            "ISSUES:",
            from: response
        )

        let suggestions = extractList(
            "SUGGESTIONS:",
            from: response
        )

        return ScreenshotAnalysis(
            title: title,
            summary: summary,
            category: category,
            keyPoints: keyPoints,
            detectedIssues: issues,
            suggestions: suggestions,
            extractedText: extractedText
        )
    }

    private func extractSection(
        _ section: String,
        from text: String
    ) -> String? {

        guard let startRange = text.range(
            of: section,
            options: .caseInsensitive
        ) else {
            return nil
        }

        let remaining = text[startRange.upperBound...]

        let sections = [
            "TITLE:",
            "CATEGORY:",
            "SUMMARY:",
            "KEY_POINTS:",
            "ISSUES:",
            "SUGGESTIONS:",
            "OCR_TEXT:"
        ]

        var endIndex = remaining.endIndex

        for nextSection in sections {

            if let range = remaining.range(
                of: nextSection,
                options: .caseInsensitive
            ) {

                if range.lowerBound < endIndex {
                    endIndex = range.lowerBound
                }
            }
        }

        let value = remaining[..<endIndex]
            .trimmingCharacters(in: .whitespacesAndNewlines)

        return value.isEmpty ? nil : value
    }

    private func extractList(
        _ section: String,
        from text: String
    ) -> [String] {

        guard let content = extractSection(
            section,
            from: text
        ) else {
            return []
        }

        return content
            .components(separatedBy: .newlines)
            .map {
                $0
                    .replacingOccurrences(
                        of: #"^\s*[-•*]\s*"#,
                        with: "",
                        options: .regularExpression
                    )
                    .trimmingCharacters(
                        in: .whitespacesAndNewlines
                    )
            }
            .filter {
                !$0.isEmpty
            }
    }
}
