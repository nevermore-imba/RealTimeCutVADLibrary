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
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.5/onnxruntime.xcframework.zip",
            checksum: "1aec02684d70f3e414f18fa2b24af055d31fd07e585c1865c758dbc869a2a1a3"
        ),
        .binaryTarget(
            name: "webrtc_audio_processing",
            url: "https://github.com/helloooideeeeea/RealTimeCutVADLibraryForXCFramework/releases/download/v1.0.5/webrtc_audio_processing.xcframework.zip",
            checksum: "8b664874a30b5f8899607ef2b2606a733c63ec00c1e08a880cf014d0964ce76a"
        )
    ]
)
