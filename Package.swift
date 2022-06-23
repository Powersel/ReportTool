// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RokuReportTool",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "RokuReportTool", targets: ["RokuReportTool"]),
    ],
    dependencies: [
        .package(name: "RokuAutoLayout", url: "https://github.com/Powersel/UIElements.git", from: "0.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RokuReportTool",
            dependencies: [
                "RokuAutoLayout"
            ]),
        .testTarget(
            name: "RokuReportToolTests",
            dependencies: ["RokuReportTool"]),
    ]
)
