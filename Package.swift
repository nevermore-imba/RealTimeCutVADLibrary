// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "RealTimeCutVADLibrary",
    platforms: [
        .iOS(.v15),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "RealTimeCutVADLibrary",
            targets: ["RealTimeCutVADLibrary"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RealTimeCutVADLibrary",
            dependencies: [
                .target(name: "RealTimeCutVADCXXLibrary"),
                .target(name: "onnxruntime"),
                .target(name: "webrtc_audio_processing")
            ],
            path: "RealTimeCutVADLibrary/src",
            sources: nil,
            resources: [
                .process("Resources")
            ],
            publicHeadersPath: "include"
        ),
        .binaryTarget(
            name: "RealTimeCutVADCXXLibrary",
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.0/RealTimeCutVADCXXLibrary.xcframework.zip",
            checksum: "b6351d3d64ead9e9777225f8f5231b6a623fb856066cbd3efe1e76c94ffea11e"
        ),
        .binaryTarget(
            name: "onnxruntime",
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.0/onnxruntime.xcframework.zip",
            checksum: "498ba860229e0ce45e6983ce44478a836b0c0763451ed37a8b1f8e74a8a0dc1f"
        ),
        .binaryTarget(
            name: "webrtc_audio_processing",
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.0/webrtc_audio_processing.xcframework.zip",
            checksum: "3ee3d36e9207a09fa3133c405f08a49a0d023f173ee5b4a47c047362aba56856"
        )
    ]
)
