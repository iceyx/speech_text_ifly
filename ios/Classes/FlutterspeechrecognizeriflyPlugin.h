#import <Flutter/Flutter.h>
#import "IFlyMSC/IFlyMSC.h"

@class IFlySpeechRecognizer;

@interface FlutterspeechrecognizeriflyPlugin : NSObject<FlutterPlugin,IFlySpeechRecognizerDelegate,IFlyRecognizerViewDelegate>

@property FlutterMethodChannel *channel;

@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;//Recognition conrol without view
@property (nonatomic, strong) IFlyRecognizerView *iflyRecognizerView;//Recognition control with view

@property (nonatomic, assign) BOOL isCanceled;


@end
