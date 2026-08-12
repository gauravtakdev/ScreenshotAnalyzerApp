//
//  OCRService.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import Vision
import UIKit

final class OCRService {

    func recognizeText(
        from image: UIImage
    ) async throws -> String {

        guard let cgImage = image.normalizedCGImage else {
            throw OCRError.invalidImage
        }

        let request = VNRecognizeTextRequest()

        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        request.automaticallyDetectsLanguage = true

        let handler = VNImageRequestHandler(
            cgImage: cgImage,
            options: [:]
        )

        try handler.perform([request])

        guard let observations = request.results else {
            return ""
        }

        let text = observations
            .compactMap {
                $0.topCandidates(1).first?.string
            }
            .joined(separator: "\n")

        return text
    }
}

enum OCRError: LocalizedError {

    case invalidImage

    var errorDescription: String? {

        switch self {
        case .invalidImage:
            return "Unable to process the selected image."
        }
    }
}