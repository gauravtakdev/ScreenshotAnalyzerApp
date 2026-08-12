//
//  UIImage+CGImage.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//

import UIKit

extension UIImage {

    var normalizedCGImage: CGImage? {

        if let cgImage {
            return cgImage
        }

        let format = UIGraphicsImageRendererFormat()
        format.scale = 1

        let renderer = UIGraphicsImageRenderer(
            size: size,
            format: format
        )

        let renderedImage = renderer.image { context in
            draw(in: CGRect(origin: .zero, size: size))
        }

        return renderedImage.cgImage
    }
}
