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
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.4/IDnowEID.xcframework.zip",
            checksum: "e723fc19003c1457eea0f40214a5dfb2f67a6e2e6a13ab9ee0c530fb8c1364ad"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.4/IDnowEIDDynamic.xcframework.zip",
            checksum: "bc3db91d8c2b289c44fbd854d2e6bedc6a51bc310d422a860c3032eba4e3b366"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.4/IDnowEIDGovernikus.xcframework.zip",
            checksum: "1506683a30a030a70f12d3f0f3868b1d4741ebce525fd8e1b0bd44398532acbe"
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
