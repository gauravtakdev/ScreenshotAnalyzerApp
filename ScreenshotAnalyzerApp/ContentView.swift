//
//  ContentView.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//

import SwiftUI
import UIKit
import FoundationModels

struct ContentView: View {

    @StateObject private var viewModel =
        ScreenshotAnalyzerViewModel()

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 24) {

                    header

                    screenshotSection

                    actionSection

                    resultSection
                }
                .padding()
            }
            .navigationTitle("Screenshot AI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var header: some View {

        VStack(spacing: 10) {

            Image(systemName: "sparkles.rectangle.stack")
                .font(.system(size: 50))
                .foregroundStyle(.tint)

            Text("AI Screenshot Analyzer")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)

            Text(
                "Understand screenshots using Vision OCR and Apple Intelligence."
            )
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }

    private var screenshotSection: some View {

        Group {

            if let image = viewModel.selectedImage {

                VStack(spacing: 12) {

                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 20
                            )
                        )
                        .shadow(
                            radius: 10,
                            y: 5
                        )

                    Button("Choose Another Screenshot") {

                        viewModel.reset()
                    }
                    .font(.subheadline)
                }

            } else {

                ScreenshotPlaceholder()
            }
        }
    }

    private var actionSection: some View {

        VStack(spacing: 12) {

            ScreenshotPickerView(
                selectedImage: $viewModel.selectedImage
            )

            if viewModel.selectedImage != nil {

                Button {

                    viewModel.analyze()

                } label: {

                    Label(
                        "Analyze Screenshot",
                        systemImage: "wand.and.stars"
                    )
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    isAnalyzing
                )
            }
        }
    }

    @ViewBuilder
    private var resultSection: some View {

        switch viewModel.state {

        case .idle:
            EmptyView()

        case .loading:
            LoadingView()

        case .success(let analysis):

            AnalysisResultView(
                analysis: analysis
            )
            .padding()
            .background(
                RoundedRectangle(
                    cornerRadius: 20
                )
                .fill(
                    Color.secondary.opacity(0.06)
                )
            )

        case .failure(let message):

            VStack(spacing: 10) {

                Image(
                    systemName:
                        "exclamationmark.triangle.fill"
                )
                .font(.largeTitle)
                .foregroundStyle(.orange)

                Text("Analysis Failed")
                    .font(.headline)

                Text(message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                Button("Try Again") {

                    viewModel.analyze()
                }
                .buttonStyle(.bordered)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }

    private var isAnalyzing: Bool {

        if case .loading = viewModel.state {
            return true
        }

        return false
    }
}
