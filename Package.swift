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
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.10"),
        .package(url: "https://github.com/Governikus/AusweisApp2-SDK-iOS.git", exact: "2.2.2")
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/100.0.1/IDnowEID.xcframework.zip",
            checksum: "c1589fbcb0b6a39fc10f2d25a0fdbb7e09f7666c1d9d042acc8a025d99e883a3"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/100.0.1/IDnowEIDDynamic.xcframework.zip",
            checksum: "91752a84b938560ccd1e0b354491745e0c677c821cd9982f9eeaea73c7d44c73"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/100.0.1/IDnowEIDGovernikus.xcframework.zip",
            checksum: "0240adebcba833c9cba89a6143f88f2f80467ab0c2c66baaf7caee61f412c335"
        ),
        .binaryTarget(
            name: "OpenSSL",
            path: "Frameworks/OpenSSL.xcframework"
        ),
        .target(
            name: "IDnowEIDDynamicWrapper",
            dependencies: [
                "IDnowEIDDynamic",
                "OpenSSL",
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios")
            ],
            path: "sources-dynamic"
        ),
        .target(
            name: "IDnowEIDGovernikusWrapper",
            dependencies: [
                "IDnowEIDGovernikus",
                "OpenSSL",
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios"),
                .product(name: "AusweisApp2", package: "AusweisApp2-SDK-iOS")
            ],
            path: "sources-governikus"
        )
    ]
)
