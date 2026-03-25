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
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.0/IDnowEID.xcframework.zip",
            checksum: "741340b904a774de65527940ce9269620501ee5b09304ff1670bd20fe8d39817"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.0/IDnowEIDDynamic.xcframework.zip",
            checksum: "28bbe58dd47b9ed065ba7e70b950ca84567d8cfbf1cfdd68b4a2691a8b83750a"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.0/IDnowEIDGovernikus.xcframework.zip",
            checksum: "65433aedadf207dcb345c1e67a37f2a705d145edae6ceabf8d667ee72acb9d48"
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
