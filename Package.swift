// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "QKMRZScanner",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "QKMRZScanner",
            targets: ["QKMRZScanner"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Mattijah/QKMRZParser.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "QKMRZScanner",
            dependencies: ["QKMRZParser"],
            path: "QKMRZScanner",
            resources: [
                .process("Supporting Files/tessdata/ocrb.traineddata")
            ]
        )
    ]
)
