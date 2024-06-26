// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1-0-3"
let shieldbehavioural_checksum = "38879e7f0a27cd19d945e2110db3e3ae2306457970b125cf669906f87bdbad11"

let package = Package(
    name: "shield-behavioural-analysis-spm",
    platforms: [
        .iOS(.v12) // Adjust deployment target if needed
    ],
    products: [
        .library(
            name: "BehaviouralAnalysis",
            targets: ["BehaviouralAnalysisTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/shield-ai-technology/shieldfraud-spm.git", branch: "main")
    ],
    targets: [
        .binaryTarget(
            name: "BehaviouralAnalysis",
            url: "https://s3.amazonaws.com/cashshield-sdk/shieldbehavioural-ios-swift-\(version).zip",
            checksum: shieldbehavioural_checksum
        ),
        .target(
            name: "BehaviouralAnalysisTarget",
            dependencies: [
              .target(name: "BehaviouralAnalysis"),
              .product(name: "ShieldFraud", package: "shieldfraud-spm")
            ]
          )
    ]
)
