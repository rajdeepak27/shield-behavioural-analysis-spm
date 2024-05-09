// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1-0-2"
let shieldbehavioural_checksum = "d46c8440e933c6b9c13500b844920cfd4eef4e9b4906c8d6ff4572a6a2589d70"

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
