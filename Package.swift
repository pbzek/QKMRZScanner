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
        // Asegúrate de apuntar a tu propio fork de QKMRZParser
        .package(url: "https://github.com/pbzek/QKMRZParser.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "QKMRZScanner",
            dependencies: ["QKMRZParser"],
            path: "Sources/QKMRZScanner",
            resources: [
                .process("Resources/ocrb.traineddata")
            ]
        ),
        .testTarget(
            name: "QKMRZScannerTests",
            dependencies: ["QKMRZScanner"],
            path: "Tests/QKMRZScannerTests"
        ),
    ]
)
