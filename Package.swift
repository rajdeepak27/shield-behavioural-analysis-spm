// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1-0-0"
let shieldbehavioural_checksum = "9c543086a65514b4249d32b1b56f4942eadf1cbd383947889d345b1cffd18e62"


let package = Package(
    name: "shield-behavioural-analysis-spm",
    platforms: [
           .iOS(.v12)
       ],
    products: [
            .library(
                name: "BehaviouralAnalysis",
                targets: ["BehaviouralAnalysis"]
            )
        ],
        targets: [
            .binaryTarget(
                name: "BehaviouralAnalysis",
                url: "https://s3.amazonaws.com/cashshield-sdk/shieldbehavioural-ios-swift-\(version).zip",
                checksum: shieldbehavioural_checksum
            )
        ]
)
