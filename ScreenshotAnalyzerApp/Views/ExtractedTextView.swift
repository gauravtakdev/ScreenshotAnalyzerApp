//
//  ExtractedTextView.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import SwiftUI

struct ExtractedTextView: View {

    let text: String

    @State private var isExpanded = false

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            HStack {

                Label(
                    "Extracted Text",
                    systemImage: "text.viewfinder"
                )
                .font(.headline)

                Spacer()

                Button(
                    isExpanded ? "Hide" : "Show"
                ) {

                    withAnimation {
                        isExpanded.toggle()
                    }
                }
                .font(.subheadline)
            }

            if isExpanded {

                Text(
                    text.isEmpty
                    ? "No text detected."
                    : text
                )
                .font(.system(.body, design: .monospaced))
                .textSelection(.enabled)
                .padding()
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .background(
                    Color.secondary.opacity(0.08)
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 14
                    )
                )
            }
        }
    }
}