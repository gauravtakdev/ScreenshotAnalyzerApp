//
//  ScreenshotAnalysis.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import Foundation

struct ScreenshotAnalysis: Identifiable, Equatable {

    let id = UUID()

    let title: String
    let summary: String
    let category: String
    let keyPoints: [String]
    let detectedIssues: [String]
    let suggestions: [String]
    let extractedText: String

    static let empty = ScreenshotAnalysis(
        title: "",
        summary: "",
        category: "",
        keyPoints: [],
        detectedIssues: [],
        suggestions: [],
        extractedText: ""
    )
}