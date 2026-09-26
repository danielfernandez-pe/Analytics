// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Watcher",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "Watcher",
            targets: ["Watcher"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Watcher",
            dependencies: [],
            path: "Sources",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
                .enableUpcomingFeature("InferIsolatedConformances"),
                .enableUpcomingFeature("NonisolatedNonsendingByDefault")
            ]
        ),
        .testTarget(name: "WatcherTests", dependencies: ["Watcher"]),
    ]
)
