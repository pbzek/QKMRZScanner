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
        .package(url: "https://github.com/pbzek/QKMRZParser.git", .branch("master"))
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
