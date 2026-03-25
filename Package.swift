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
            url: "https://github.com/nabil-lahlou-idnow/eid-test.git/releases/download/1.0.2/IDnowEID.xcframework.zip",
            checksum: "6e4e39b092666c91266ed1c9ba6482d80b038c46af920f08a1d776c36fc35a4c"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/nabil-lahlou-idnow/eid-test.git/releases/download/1.0.2/IDnowEIDDynamic.xcframework.zip",
            checksum: "6bf56582454dc916304a7d34c711fb90a4aaff9fcf64d94df97370e397e44429"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/nabil-lahlou-idnow/eid-test.git/releases/download/1.0.2/IDnowEIDGovernikus.xcframework.zip",
            checksum: "30bbf391d74b68d793d6a6a5983f404b62346c68b196d1a3bd4ed93f476992ba"
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
