// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftChallenges",
    platforms: [.macOS(.v10_15)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftChallenges",
            targets: ["SwiftChallenges"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/lugeke/CourseraAlgorithms", from: "0.0.1"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftChallenges",
            dependencies: [.product(name: "Algorithms", package: "CourseraAlgorithms")]),
        .testTarget(
            name: "SwiftChallengesTests",
            dependencies: ["SwiftChallenges"],
            resources: [
                    .copy("input.txt"),
                  ])
    ]
)
