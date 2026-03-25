// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "IDnowEID",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "IDnowEID",
            targets: ["IDnowEID"]
        ),
        .library(
            name: "IDnowEIDDynamic",
            targets: ["IDnowEIDDynamicWrapper"]
        ),
        .library(
            name: "IDnowEIDGovernikus",
            targets: ["IDnowEIDGovernikusWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", exact: "3.6.1"),
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.4"),
        .package(url: "https://github.com/Governikus/AusweisApp2-SDK-iOS.git", exact: "2.2.2")
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.3/IDnowEID.xcframework.zip",
            checksum: "f5fc2cc0262a8cf01698084a20956ebfa372b96294b0e0c1b598d045aecb8e67"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.3/IDnowEIDDynamic.xcframework.zip",
            checksum: "191111d6f74fc94afb2849e9af2b49511e700ebc946d87cc47beb4278955fb9e"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.3/IDnowEIDGovernikus.xcframework.zip",
            checksum: "a195fe36b620ffc009d3a29641f28a8cd4b4190ed24c88bcaac7e1cc6dd2e565"
        ),
        .target(
            name: "IDnowEIDDynamicWrapper",
            dependencies: [
                "IDnowEIDDynamic",
                .product(name: "OpenSSL", package: "OpenSSL"),
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios")
            ],
            path: "sources-dynamic"
        ),
        .target(
            name: "IDnowEIDGovernikusWrapper",
            dependencies: [
                "IDnowEIDGovernikus",
                .product(name: "OpenSSL", package: "OpenSSL"),
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios"),
                .product(name: "AusweisApp2", package: "AusweisApp2-SDK-iOS")
            ],
            path: "sources-governikus"
        )
    ]
)
