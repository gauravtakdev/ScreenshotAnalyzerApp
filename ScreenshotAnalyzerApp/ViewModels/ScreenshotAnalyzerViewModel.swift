//
//  ScreenshotAnalyzerViewModel.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import SwiftUI
import UIKit
import FoundationModels
import Combine

@MainActor
final class ScreenshotAnalyzerViewModel: ObservableObject {

    @Published var selectedImage: UIImage?

    @Published var state: AnalysisState = .idle

    @Published var isPickerPresented = false

    private let analyzerService = ScreenshotAnalyzerService()

    func analyze() {

        guard let selectedImage else {
            print("analyze 1 selectedImage is nil")
            return
        }

        state = .loading

        Task {

            do {

                let result = try await analyzerService.analyze(
                    image: selectedImage
                )

                state = .success(result)

            } catch {
                print("analyze 1 selectedImage \(error.localizedDescription)")
                
                state = .failure(
                    error.localizedDescription
                )
            }
        }
    }

    func reset() {

        selectedImage = nil
        state = .idle
    }
}
