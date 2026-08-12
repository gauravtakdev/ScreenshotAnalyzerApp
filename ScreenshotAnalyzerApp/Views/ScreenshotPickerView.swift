//
//  ScreenshotPickerView.swift
//  ScreenshotAnalyzerApp
//
//  Created by Gaurav Tak on 12/08/26.
//


import SwiftUI
import PhotosUI

struct ScreenshotPickerView: View {

    @Binding var selectedImage: UIImage?

    @State private var selectedItem: PhotosPickerItem?

    var body: some View {

        PhotosPicker(
            selection: $selectedItem,
            matching: .images
        ) {

            Label(
                "Choose Screenshot",
                systemImage: "photo.on.rectangle"
            )
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
        }
        .buttonStyle(.borderedProminent)
        .onChange(of: selectedItem) { _, newItem in

            guard let newItem else {
                return
            }

            Task {

                do {

                    if let data = try await newItem.loadTransferable(
                        type: Data.self
                    ),
                    let image = UIImage(data: data) {

                        await MainActor.run {
                            selectedImage = image
                        }
                    }

                } catch {

                    print(
                        "Image loading failed:",
                        error.localizedDescription
                    )
                }
            }
        }
    }
}
