//
//  AnalysisListSection.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import SwiftUI

struct AnalysisListSection: View {

    let title: String
    let icon: String
    let items: [String]

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Label(
                title,
                systemImage: icon
            )
            .font(.headline)

            VStack(alignment: .leading, spacing: 10) {

                ForEach(
                    Array(items.enumerated()),
                    id: \.offset
                ) { _, item in

                    HStack(
                        alignment: .top,
                        spacing: 10
                    ) {

                        Image(systemName: "circle.fill")
                            .font(.system(size: 5))
                            .padding(.top, 7)

                        Text(item)
                            .font(.body)
                    }
                }
            }
        }
    }
}