// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "QKMRZScanner",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "QKMRZScanner",
            targets: ["QKMRZScanner"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyTesseract/SwiftyTesseract.git", from: "1.2.5"),
        .package(url: "https://github.com/Mattijah/QKMRZParser.git", .exact("1.1.1"))
    ],
    targets: [
        .target(
            name: "QKMRZScanner",
            dependencies: ["SwiftyTesseract", "QKMRZParser"],
            path: "Sources/QKMRZScanner",
            resources: [
                .process("Resources/ocrb.traineddata")
            ]),
        .testTarget(
            name: "QKMRZScannerTests",
            dependencies: ["QKMRZScanner"],
            path: "Tests/QKMRZScannerTests"),
    ]
)

