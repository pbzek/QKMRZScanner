// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "QKMRZScanner",
    platforms: [
        .iOS(.v12)  // Cambiado de .v11 a .v12
    ],
    products: [
        .library(
            name: "QKMRZScanner",
            targets: ["QKMRZScanner"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pbzek/QKMRZParser.git", from: "1.1.1")
    ],
    targets: [
        .target(
            name: "QKMRZScanner",
            dependencies: ["QKMRZParser"],
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
