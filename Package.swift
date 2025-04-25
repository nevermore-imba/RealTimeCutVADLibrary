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
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.4/onnxruntime.xcframework.zip",
            checksum: "d29101e959389f8eae869fdc5f3ae3edd80ca95302bd7cd7a5e89661ab3032b7"
        ),
        .binaryTarget(
            name: "webrtc_audio_processing",
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.4/webrtc_audio_processing.xcframework.zip",
            checksum: "352db0aeb2771c6c27001b513058348c89462e0b2fa91375f1dd5114aeaf9020"
        )
    ]
)
