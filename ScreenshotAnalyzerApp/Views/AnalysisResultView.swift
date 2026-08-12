//
//  AnalysisResultView.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import SwiftUI

struct AnalysisResultView: View {

    let analysis: ScreenshotAnalysis

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {

            header

            summarySection

            if !analysis.keyPoints.isEmpty {

                AnalysisListSection(
                    title: "Key Points",
                    icon: "sparkles",
                    items: analysis.keyPoints
                )
            }

            if !analysis.detectedIssues.isEmpty {

                AnalysisListSection(
                    title: "Potential Issues",
                    icon: "exclamationmark.triangle",
                    items: analysis.detectedIssues
                )
            }

            if !analysis.suggestions.isEmpty {

                AnalysisListSection(
                    title: "Suggestions",
                    icon: "lightbulb",
                    items: analysis.suggestions
                )
            }

            ExtractedTextView(
                text: analysis.extractedText
            )
        }
    }

    private var header: some View {

        VStack(alignment: .leading, spacing: 10) {

            HStack {

                Text(analysis.title)
                    .font(.title2.bold())

                Spacer()

                Text(analysis.category)
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Color.accentColor.opacity(0.12)
                    )
                    .clipShape(
                        Capsule()
                    )
            }
        }
    }

    private var summarySection: some View {

        VStack(alignment: .leading, spacing: 10) {

            Label(
                "AI Summary",
                systemImage: "brain"
            )
            .font(.headline)

            Text(analysis.summary)
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }
}