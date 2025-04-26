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
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.3/RealTimeCutVADCXXLibrary.xcframework.zip",
            checksum: "00c4a8cd5a22e634f34d744eb06aa88a4494e12a5f9d4573989129a1f4c7e76d"
        ),
        .binaryTarget(
            name: "onnxruntime",
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.6/onnxruntime.xcframework.zip",
            checksum: "ce9fafa489cc527c2c9a1297ece8a7bb9c024ec3d51da0b3d08bd5007583110b"
        ),
        .binaryTarget(
            name: "webrtc_audio_processing",
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.6/webrtc_audio_processing.xcframework.zip",
            checksum: "5253984bdf20fb483b34c884f71a32b1f9a3078a932c601fed72bb4ac1565e86"
        )
    ]
)
