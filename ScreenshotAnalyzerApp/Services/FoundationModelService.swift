//
//  FoundationModelService.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import Foundation
import FoundationModels
import UIKit
import ImageIO

@available(iOS 26.0, *)
final class FoundationModelService {

    private let session: LanguageModelSession

    init() {
        self.session = LanguageModelSession()
    }

    /// Analyzes OCR text extracted from a screenshot.
    ///
    /// - Parameter extractedText: Text detected by Vision.
    /// - Returns: AI-generated screenshot analysis.
    func analyzeScreenshot(
        extractedText: String
    ) async throws -> String {

        let prompt = Prompt {
            """
            You are an AI-powered screenshot analyzer.

            Analyze the text extracted from a mobile application screenshot.

            Provide your response using the following sections:

            1. Screen Type
            Identify what kind of screen this appears to be.

            2. Summary
            Give a concise summary of what the screen contains.

            3. Important Information
            List the important information visible on the screen.

            4. UI/UX Observations
            Mention anything notable about the interface based on the
            available text.

            5. Errors or Warnings
            Identify any error messages, warnings, or suspicious messages.

            6. Suggestions
            Provide useful suggestions if there are obvious usability
            or UI issues.

            Keep the response clear, concise, and easy to read.

            Screenshot text:
            \(extractedText)
            """
        }

        let response = try await session.respond(to: prompt)

        return response.content
    }
}

enum FoundationModelError: LocalizedError {

    case invalidImage

    var errorDescription: String? {
        switch self {
        case .invalidImage:
            return "Unable to convert the selected screenshot into a CGImage."
        }
    }
}
