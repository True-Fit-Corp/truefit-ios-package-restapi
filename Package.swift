// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TrueFit",
    platforms: [.iOS(.v13), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TrueFit",
            targets: ["TrueFit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TrueFit",
            path: "Sources/truefit-ios-package-restapi",
            exclude: ["macOS"]),
        .testTarget(
            name: "TrueFitTests",
            dependencies: ["TrueFit"],
            path: "Tests/truefit-ios-package-restapiTests"
        ),
    ]
)
