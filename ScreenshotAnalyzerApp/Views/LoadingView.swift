//
//  LoadingView.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import SwiftUI

struct LoadingView: View {

    var body: some View {

        VStack(spacing: 20) {

            ProgressView()
                .controlSize(.large)

            VStack(spacing: 6) {

                Text("Analyzing Screenshot")
                    .font(.headline)

                Text("Vision is reading the screenshot and AI is understanding it.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(30)
    }
}