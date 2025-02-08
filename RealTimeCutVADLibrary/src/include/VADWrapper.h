//
//  VADWrapper.h
//  RealTimeCutVADLibrary
//
//  Created by Yasushi Sakita on 2025/02/03.
//

#import <Foundation/Foundation.h>

//! Project version number for RealTimeCutVADLibrary.
FOUNDATION_EXPORT double RealTimeCutVADLibraryVersionNumber;

//! Project version string for RealTimeCutVADLibrary.
FOUNDATION_EXPORT const unsigned char RealTimeCutVADLibraryVersionString[];

typedef NS_ENUM(NSInteger, SL) {
    SAMPLERATE_8 = 0,
    SAMPLERATE_16 = 1,
    SAMPLERATE_24 = 2,
    SAMPLERATE_48 = 3,
};

typedef NS_ENUM(NSInteger, SMVER) {
    v4 = 0,
    v5 = 1,
};

@protocol VADDelegate <NSObject>

- (void)voiceStarted;
- (void)voiceEndedWithWavData:(NSData *)wavData;

@end

@interface VADWrapper : NSObject

@property (nonatomic, weak) id<VADDelegate> delegate;

- (instancetype)init;
- (void)dealloc;
- (void)setSamplerate:(SL)sl;
- (void)setThresholdWithVadStartDetectionProbability:(float)a
                          VadEndDetectionProbability:(float)b
                              VoiceStartVadTrueRatio:(float)c
                              VoiceEndVadFalseRatio:(float)d
                                VoiceStartFrameCount:(int)e
                                  VoiceEndFrameCount:(int)f;
- (void)processAudioData:(NSArray<NSNumber *> *)audioData;
- (void)setSileroModel:(SMVER)modelVersion;

@end
