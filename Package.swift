// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FLineCore",
    
    products: [
        .library(
            name: "FLineCore",
            targets: ["FLineCore"]),
    ],
    
    dependencies: [
        // MARK: Common dependencies
        .package(
            url: "https://github.com/ReSwift/ReSwift.git",
            from: "5.0.0"),
        
        // MARK: Dependencies for testing
        .package(
            url: "https://github.com/Quick/Quick.git",
            from: "2.0.0"),
        
        .package(
            url: "https://github.com/Quick/Nimble.git",
            from: "8.0.0"),
    ],
    
    targets: [
        .target(
            name: "FLineCore",
            dependencies: []),
        
        .testTarget(
            name: "FLineCoreTests",
            dependencies: [
                "FLineCore",
                "ReSwift",
                "Quick",
                "Nimble"
            ]),
    ]
)
