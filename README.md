# 🤖 AI Screenshot Analyzer

An AI-powered Screenshot Analyzer built with **SwiftUI**, **Vision OCR**, and **Apple Foundation Models**. Extract text from screenshots and generate intelligent summaries, screen analysis, error detection, UI/UX observations, and suggestions using modern on-device AI capabilities.

## ✨ Features

- 📸 Screenshot/image input
- 🔍 Text extraction using Apple's Vision framework
- 🤖 AI-powered analysis using Foundation Models
- 🧠 Screen type identification
- 📝 Screenshot summarization
- ⚠️ Error and warning detection
- 🎨 UI/UX observations
- 💡 Improvement suggestions
- ⚡ Modern Swift concurrency with `async/await`
- 📱 SwiftUI-based interface
- 🔒 Designed around Apple's on-device AI capabilities

## 🏗️ Architecture

```text
Screenshot
    ↓
OCRService
    ↓
Vision Framework
    ↓
Extracted Text
    ↓
FoundationModelService
    ↓
Foundation Models
    ↓
AI Analysis
    ↓
ScreenshotAnalysis
    ↓
SwiftUI
```

## 🧩 Core Components

### OCRService

Uses Apple's Vision framework to recognize text from the supplied screenshot.

```swift
let extractedText = try await ocrService.recognizeText(
    from: image
)
```

### FoundationModelService

Passes the OCR output to Apple's Foundation Models framework and generates an AI-powered analysis.

```swift
let aiResponse = try await foundationModelService.analyzeScreenshot(
    extractedText: extractedText
)
```

### Screenshot Analyzer Flow

```swift
func analyze(
    image: UIImage
) async throws -> ScreenshotAnalysis {

    // Step 1: OCR
    let extractedText = try await ocrService.recognizeText(
        from: image
    )

    // Step 2: AI analysis
    let aiResponse = try await foundationModelService.analyzeScreenshot(
        extractedText: extractedText
    )

    // Step 3: Convert AI response into our model
    return parseResponse(
        aiResponse,
        extractedText: extractedText
    )
}
```

## 🛠️ Technologies

- **Swift**
- **SwiftUI**
- **Vision**
- **Foundation Models**
- **UIKit**
- **Swift Concurrency**
- **iOS 26**

## 📋 Requirements

- macOS compatible with the required Xcode version
- Xcode 26.6 or later
- iOS 26 or later
- A device/simulator configuration that supports the Foundation Models framework

## 🚀 Getting Started

1. Clone the repository.

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
```

2. Open the project in Xcode.

3. Select an iOS 26 compatible target.

4. Build and run the application.

5. Provide a screenshot and let the app perform OCR and AI analysis.

> **Note:** Foundation Models availability depends on the device, OS version, and Apple's supported model/runtime configuration.

## 🔍 Example Analysis

The analyzer is designed to produce information such as:

### Screen Type
Identifies the likely type of screen represented by the screenshot.

### Summary
Provides a concise description of the visible content.

### Important Information
Highlights relevant text and information detected through OCR.

### Errors or Warnings
Identifies potential error messages, warnings, or suspicious messages.

### UI/UX Observations
Provides observations based on the available screenshot information.

### Suggestions
Suggests possible improvements when obvious usability or UI issues can be identified.

## 📁 Suggested Project Structure

```text
AIScreenshotAnalyzer/
│
├── App/
│   └── AIScreenshotAnalyzerApp.swift
│
├── Views/
│   └── ContentView.swift
│
├── Services/
│   ├── OCRService.swift
│   └── FoundationModelService.swift
│
├── Models/
│   └── ScreenshotAnalysis.swift
│
└── Resources/
```

Adapt the structure above to match the actual files in your project.

## 🧠 Foundation Models

This project uses Apple's **Foundation Models** APIs available on supported Apple platforms.

The implementation uses:

```swift
import FoundationModels
```

and the `Prompt` / `LanguageModelSession` APIs to generate analysis from OCR-extracted text.

The current implementation intentionally does not depend on an `Attachment` API for passing a `CGImage` directly to Foundation Models. Instead, Vision performs OCR first and the extracted text is supplied to the model.

## 🔐 Privacy

The project is designed around Apple's on-device AI technologies. Actual processing behavior depends on the device, OS, Foundation Models availability, and Apple's runtime policies.

Do not use screenshots containing sensitive or confidential information unless you understand how the specific deployment environment processes that data.

## 🎯 Learning Goals

This project demonstrates how to combine:

1. SwiftUI for the application UI
2. Vision for OCR
3. Foundation Models for AI-powered analysis
4. Swift concurrency for asynchronous processing
5. Strongly typed Swift models for presenting AI results

It can serve as a starting point for experimenting with native AI experiences on Apple platforms.

## 🔮 Future Improvements

Possible enhancements include:

- Direct visual/image understanding when supported by the target Foundation Models API
- More structured AI output using `@Generable`
- Screenshot region detection
- UI element classification
- Accessibility recommendations
- Color and contrast analysis
- Layout and spacing analysis
- Multi-language OCR
- Analysis history
- Exportable reports
- Share Sheet integration

## 📄 License

Add your preferred license here, for example:

```text
MIT License
```

---

⭐ If you find this project useful, consider giving the repository a star!
