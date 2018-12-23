// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "LensKit",
    dependencies: [
    ],
    targets: [
        .target(name: "LensKit", dependencies: []),
        .testTarget( name: "LensKitTests", dependencies: ["LensKit"])
    ]
)
