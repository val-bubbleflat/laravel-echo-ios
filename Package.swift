// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "LaravelEchoIOS",
    products: [
        .library(name: "LaravelEchoIOS", targets: ["LaravelEchoIOS"])
    ],
    dependencies: [
        .package(url: "https://github.com/socketio/socket.io-client-swift", .upToNextMinor(from: "15.2.0")),
    ],
    targets: [
        .target(name: "LaravelEchoIOS", dependencies: ["SocketIO"]),
    ]
)
