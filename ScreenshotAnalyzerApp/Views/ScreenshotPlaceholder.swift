//
//  ScreenshotPlaceholder.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import SwiftUI

struct ScreenshotPlaceholder: View {

    var body: some View {

        VStack(spacing: 16) {

            Image(
                systemName:
                    "rectangle.dashed.and.paperclip"
            )
            .font(.system(size: 50))
            .foregroundStyle(.secondary)

            Text("Select a Screenshot")
                .font(.headline)

            Text(
                "Choose a screenshot from your Photos library to begin."
            )
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
        .frame(
            maxWidth: .infinity,
            minHeight: 240
        )
        .background(
            RoundedRectangle(
                cornerRadius: 24
            )
            .stroke(
                Color.secondary.opacity(0.3),
                style: StrokeStyle(
                    lineWidth: 1,
                    dash: [8]
                )
            )
        )
    }
}