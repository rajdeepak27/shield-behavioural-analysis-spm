// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1-0-1"
let shieldbehavioural_checksum = "7d60952c24227fbd05646b88f02fa9e9afc2d4ad34be8bda36df79e643773832"

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
        .package(url: "https://github.com/shield-ai-technology/shieldfraud-spm.git", from: "1.5.37")
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
