# RealTime Silero VAD iOS/macOS Library

A real-time Voice Activity Detection (VAD) library for iOS and macOS using Silero models. This library helps detect human voice in real-time, allowing developers to implement efficient voice-based features in their applications.

---

## Features

- **Real-time Voice Activity Detection (VAD)**
- **Supports Silero Model Versions v4 and v5**
- **Customizable audio sample rates**
- **Outputs WAV data with automatic sample rate conversion to 16 kHz**
- **iOS and macOS support**
- **Supports CocoaPods and Swift Package Manager (SPM)**

---

## Sample iOS App Demo

Check out the sample iOS app demonstrating real-time VAD:

[Sample iOS App Demo](https://github.com/user-attachments/assets/6e4d6ae5-4d34-4114-930b-f399bcf123ba)

---

## Installation

### Using CocoaPods

Add the following to your `Podfile` to integrate the library:

```ruby
pod 'RealTimeCutVADLibrary', :git => 'https://github.com/helloooideeeeea/RealTimeCutVADLibrary.git', :tag => '1.0.1'
```

Then, run:

```bash
pod install
```

### Using Swift Package Manager (SPM)

You can also integrate the library using Swift Package Manager. Add the following to your `Package.swift` file:

```swift
.dependencies: [
    .package(url: "https://github.com/helloooideeeeea/RealTimeCutVADLibrary.git", from: "1.0.1")
]
```

Or, add the URL directly through Xcode's **File > Swift Packages > Add Package Dependency**.

---

## Usage

Import the library and set up VAD in your `ViewController`:

```swift
import RealTimeCutVADLibrary

class ViewController: UIViewController {
    var vadManager: VADWrapper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize VAD Manager
        vadManager = VADWrapper()

        // Set VAD delegate to receive callbacks
        vadManager?.delegate = self

        // Set Silero model version (v4 or v5)
        vadManager?.setSileroModel(.v4)

        // Set audio sample rate (8, 16, 24, or 48 kHz)
        vadManager?.setSamplerate(.SAMPLERATE_48)

        // Prepare audio data array (mono)
        var monoralDataArray: [NSNumber] = []

        // Process audio data through VAD
        vadManager?.processAudioData(monoralDataArray)
    }
}

extension ViewController: VADDelegate {
    // Called when voice activity starts
    func voiceStarted() {
        print("Voice detected!")
    }

    // Called when voice activity ends, providing WAV data at 16 kHz
    // The Data object includes the WAV file header metadata, making it ready for playback or saving directly.
    func voiceEnded(withWavData wavData: Data!) {
        print("Voice ended. WAV data length: \(wavData.count) bytes")
    }
}
```

---

## Configuration Options

### Sample Rates
You can set the audio sample rate using `setSamplerate`:

- `.SAMPLERATE_8`  (8 kHz)
- `.SAMPLERATE_16` (16 kHz)
- `.SAMPLERATE_24` (24 kHz)
- `.SAMPLERATE_48` (48 kHz)

### Silero Model Versions
Choose between Silero model versions:

- `.v4` - Silero Model Version 4
- `.v5` - Silero Model Version 5

### VAD Threshold Configuration
Customize VAD detection sensitivity with `setThresholdWithVadStartDetectionProbability`:

```swift
vadManager?.setThresholdWithVadStartDetectionProbability(
    0.7,  // Start detection probability threshold
    0.7,  // End detection probability threshold
    0.8,  // True positive ratio for voice start
    0.95, // False positive ratio for voice end
    10,   // Frames to confirm voice start (0.32s)
    57    // Frames to confirm voice end (1.792s)
)

// Example:
// Voice activity will be triggered if 80% of the audio points in a 10-frame period
// have a VAD probability greater than 70%.
// Voice will be considered ended if 95% of the audio points in a 57-frame period
// have a VAD probability less than 70%.

```

#### **Important Notes:**
- **Default Thresholds for Silero v4**: If you do not configure the VAD thresholds manually, the library will use default thresholds optimized for Silero model **v4**.
- **Silero v5 Performance**: The performance of Silero model **v5** may vary, and it is recommended to experiment with different thresholds to achieve optimal results. For more information, refer to the [related discussion](https://github.com/SYSTRAN/faster-whisper/issues/934#issuecomment-2439340290).

---

## Algorithm Explanation

### ONNX Runtime for Silero VAD
This library leverages **ONNX Runtime (C++)** to run the Silero VAD models efficiently. By utilizing ONNX Runtime, the library achieves high-performance inference across different platforms (iOS/macOS), ensuring fast and accurate voice activity detection.

### Why Use WebRTC's Audio Processing Module (APM)?
This library utilizes WebRTC's APM for several key reasons:

- **High-pass Filtering**: Removes low-frequency noise.
- **Noise Suppression**: Reduces background noise for clearer voice detection.
- **Gain Control**: Adaptive digital gain control enhances audio levels.
- **Sample Rate Conversion**: Silero VAD requires a sample rate of 16 kHz, and APM ensures conversion from other sample rates (8, 24, or 48 kHz).

### Audio Processing Workflow

1. **Input Audio Configuration**: The library supports sample rates of 8 kHz, 16 kHz, 24 kHz, and 48 kHz.
2. **Audio Preprocessing**:
   - The audio is split into chunks based on the sample rate.
   - APM processes these chunks with filters and gain adjustments.
   - Audio is converted to 16 kHz for Silero VAD compatibility.

3. **Voice Activity Detection**:
   - The processed audio chunks are passed to Silero VAD.
   - VAD outputs a probability score indicating voice activity.

4. **Algorithm for Voice Detection**:
   - **Voice Start Detection**: When the VAD probability exceeds the threshold, a pre-buffer stores audio frames to capture speech onset.
   - **Voice End Detection**: Once silence is detected over a set number of frames, recording stops, and the audio is output as WAV data.

5. **Output**:
   - The resulting audio data is provided as WAV with a sample rate of 16 kHz.

### WebRTC APM Configuration

The following configurations are applied to optimize voice detection:

```cpp
config.gain_controller1.enabled = true;
config.gain_controller1.mode = webrtc::AudioProcessing::Config::GainController1::kAdaptiveDigital;
config.gain_controller2.enabled = true;
config.high_pass_filter.enabled = true;
config.noise_suppression.enabled = true;
config.transient_suppression.enabled = true;
config.voice_detection.enabled = false;
```

---

## Additional Resources

- [RealTimeCutVADCXXLibrary](https://github.com/helloooideeeeea/RealTimeCutVADCXXLibrary)

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Author

**helloooideeeeea**  
[Email](mailto:yasushi.sakita@gmail.com)

