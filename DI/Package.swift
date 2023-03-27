// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DI",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DI",
            targets: ["DI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Domain", path: "../Core/Domain"),
        .package(name: "Storage", path: "../Core/Storage"),
        .package(name: "Networking", path: "../Core/Networking"),
        .package(name: "AppNavigation", path: "../Main/AppNavigation"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
        .package(url: "https://github.com/Swinject/SwinjectAutoregistration.git", from: "2.8.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DI",
            dependencies: ["Domain", "Storage", "Networking", "AppNavigation", "Swinject", "SwinjectAutoregistration"]),
        .testTarget(
            name: "DITests",
            dependencies: ["DI"]),
    ]
)
