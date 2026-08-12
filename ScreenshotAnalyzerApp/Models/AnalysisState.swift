//
//  AnalysisState.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import Foundation

enum AnalysisState: Equatable {

    case idle
    case loading
    case success(ScreenshotAnalysis)
    case failure(String)
}