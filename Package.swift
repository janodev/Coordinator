// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "coordinator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "Coordinator", type: .dynamic, targets: ["Coordinator"]),
        .library(name: "CoordinatorStatic", type: .static, targets: ["Coordinator"])
    ],
    dependencies: [
        .package(url: "git@github.com:apple/swift-docc-plugin.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Coordinator",
            dependencies: [],
            path: "sources/main"
        )
    ]
)
