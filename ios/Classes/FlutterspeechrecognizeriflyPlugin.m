#import "FlutterspeechrecognizeriflyPlugin.h"

#import "IFlyMSC/IFlyMSC.h"
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "iflyMSC/IFlySpeechSynthesizer.h"
#import "iflyMSC/IFlySpeechSynthesizerDelegate.h"
#import "iflyMSC/IFlySpeechRecognizer.h"
#import "iflyMSC/IFlySpeechRecognizerDelegate.h"

#import "IATConfig.h"
#import "ISRDataHelper.h"

@interface NSError (FlutterError)
@property(readonly, nonatomic) FlutterError *flutterError;
@end

@implementation NSError (FlutterError)
- (FlutterError *)flutterError {
    return [FlutterError errorWithCode:[NSString stringWithFormat:@"Error %d", (int)self.code]
                               message:self.domain
                               details:self.localizedDescription];
}
@end

@implementation FlutterspeechrecognizeriflyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutterspeechrecognizerifly"
            binaryMessenger:[registrar messenger]];
  FlutterspeechrecognizeriflyPlugin* instance = [[FlutterspeechrecognizeriflyPlugin alloc] init];
  
  instance.channel = channel;
    
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"init" isEqualToString:call.method]) {
      [self initSpeechUtility:call result:result];
  } else if([@"start" isEqualToString:call.method]) {
      [self start:call result:result];
  } else if([@"stop" isEqualToString:call.method]) {
      [self stop:call result:result];
  } else if([@"cancel" isEqualToString:call.method]) {
      [self cancel:call result:result];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)initSpeechUtility:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    NSString* appId = arguments[@"appID"];
    
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",appId];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [IFlySetting setLogFile:LVL_ALL];
        
        //Set whether to output log messages in Xcode console
        [IFlySetting showLogcat:YES];

        //Set the local storage path of SDK
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachePath = [paths objectAtIndex:0];
        [IFlySetting setLogFilePath:cachePath];
        
        [IFlySpeechUtility createUtility:initString];
        
        [self initRecognizer:YES];
        [self initRecognizer:NO];
        
        result(@0);
    });
}

-(void)initRecognizer:(BOOL)haveView {
    NSLog(@"%s",__func__);
    
    if (haveView == NO) {
        
        //recognition singleton without view
        if (_iFlySpeechRecognizer == nil) {
            _iFlySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
        }
            
        [_iFlySpeechRecognizer setParameter:@"" forKey:[IFlySpeechConstant PARAMS]];
            
        //set recognition domain
        [_iFlySpeechRecognizer setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
        
        _iFlySpeechRecognizer.delegate = self;
        
        if (_iFlySpeechRecognizer != nil) {
            IATConfig *instance = [IATConfig sharedInstance];
            
            //set timeout of recording
            [_iFlySpeechRecognizer setParameter:instance.speechTimeout forKey:[IFlySpeechConstant SPEECH_TIMEOUT]];
            //set VAD timeout of end of speech(EOS)
            [_iFlySpeechRecognizer setParameter:instance.vadEos forKey:[IFlySpeechConstant VAD_EOS]];
            //set VAD timeout of beginning of speech(BOS)
            [_iFlySpeechRecognizer setParameter:instance.vadBos forKey:[IFlySpeechConstant VAD_BOS]];
            //set network timeout
            [_iFlySpeechRecognizer setParameter:@"20000" forKey:[IFlySpeechConstant NET_TIMEOUT]];
            
            //set sample rate, 16K as a recommended option
            [_iFlySpeechRecognizer setParameter:instance.sampleRate forKey:[IFlySpeechConstant SAMPLE_RATE]];
            
            //set language
            [_iFlySpeechRecognizer setParameter:instance.language forKey:[IFlySpeechConstant LANGUAGE]];
            //set accent
            [_iFlySpeechRecognizer setParameter:instance.accent forKey:[IFlySpeechConstant ACCENT]];
            
            //set whether or not to show punctuation in recognition results
            [_iFlySpeechRecognizer setParameter:instance.dot forKey:[IFlySpeechConstant ASR_PTT]];
            
        }
    }else  {

        //recognition singleton with view
        if (_iflyRecognizerView == nil) {
            
            _iflyRecognizerView= [[IFlyRecognizerView alloc] initWithCenter:[UIApplication sharedApplication].keyWindow.center];
        }
            
        [_iflyRecognizerView setParameter:@"" forKey:[IFlySpeechConstant PARAMS]];
            
        //set recognition domain
        [_iflyRecognizerView setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];

        
        _iflyRecognizerView.delegate = self;
        
        if (_iflyRecognizerView != nil) {
            IATConfig *instance = [IATConfig sharedInstance];
            //set timeout of recording
            [_iflyRecognizerView setParameter:instance.speechTimeout forKey:[IFlySpeechConstant SPEECH_TIMEOUT]];
            //set VAD timeout of end of speech(EOS)
            [_iflyRecognizerView setParameter:instance.vadEos forKey:[IFlySpeechConstant VAD_EOS]];
            //set VAD timeout of beginning of speech(BOS)
            [_iflyRecognizerView setParameter:instance.vadBos forKey:[IFlySpeechConstant VAD_BOS]];
            //set network timeout
            [_iflyRecognizerView setParameter:@"20000" forKey:[IFlySpeechConstant NET_TIMEOUT]];
            
            //set sample rate, 16K as a recommended option
            [_iflyRecognizerView setParameter:instance.sampleRate forKey:[IFlySpeechConstant SAMPLE_RATE]];
            
            //set language
            [_iflyRecognizerView setParameter:instance.language forKey:[IFlySpeechConstant LANGUAGE]];
            //set accent
            [_iflyRecognizerView setParameter:instance.accent forKey:[IFlySpeechConstant ACCENT]];
            //set whether or not to show punctuation in recognition results
            [_iflyRecognizerView setParameter:instance.dot forKey:[IFlySpeechConstant ASR_PTT]];
            
        }
    }
}

- (void)start:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    BOOL haveView = [arguments[@"haveView"] boolValue];
    NSLog(@"%s[IN]",__func__);
    
    BOOL ret = NO;
    if (haveView == NO) {
      
        self.isCanceled = NO;
        
        if(_iFlySpeechRecognizer == nil)
        {
            [self initRecognizer:haveView];
        }
        
        [_iFlySpeechRecognizer cancel];
        
        //Set microphone as audio source
        [_iFlySpeechRecognizer setParameter:IFLY_AUDIO_SOURCE_MIC forKey:@"audio_source"];
        
        //Set result type
        [_iFlySpeechRecognizer setParameter:@"json" forKey:[IFlySpeechConstant RESULT_TYPE]];
        
        //Set the audio name of saved recording file while is generated in the local storage path of SDK,by default in library/cache.
        [_iFlySpeechRecognizer setParameter:@"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
        
        [_iFlySpeechRecognizer setDelegate:self];
        
        ret = [_iFlySpeechRecognizer startListening];
    }else {
        
        if(_iflyRecognizerView == nil)
        {
            [self initRecognizer:haveView ];
        }
        
        //Set microphone as audio source
        [_iflyRecognizerView setParameter:IFLY_AUDIO_SOURCE_MIC forKey:@"audio_source"];

        //Set result type
        [_iflyRecognizerView setParameter:@"plain" forKey:[IFlySpeechConstant RESULT_TYPE]];
        
        //Set the audio name of saved recording file while is generated in the local storage path of SDK,by default in library/cache.
        [_iflyRecognizerView setParameter:@"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
        
        ret = [_iflyRecognizerView start];
        if (ret) {
            UIView *subView = _iflyRecognizerView.subviews[0];
            for (UIView *son in [subView subviews])
            {
                if ([son isKindOfClass:[UILabel class]]) {
                    UILabel* label = (UILabel*)son;
                    NSString* labelText = [label text];
                    if([labelText isEqualToString:@"倾听中"]) {
                        continue;
                    } else {
                        [label setHidden:TRUE];
                    }
                }
            }
        }
    }
    if (ret) {
        result(@0);
    }else{
        NSError *error = [[NSError alloc] initWithDomain:NSLocalizedString(@"M_ISR_Fail", nil) code:-1 userInfo:nil];
        result([error flutterError]);
    }
}

- (void)stop:(FlutterMethodCall*)call result:(FlutterResult)result {
    if(_iFlySpeechRecognizer != nil) {
        [_iFlySpeechRecognizer stopListening];
    }
}

- (void)cancel:(FlutterMethodCall*)call result:(FlutterResult)result {
    if(_iFlySpeechRecognizer != nil) {
        self.isCanceled = YES;

        [_iFlySpeechRecognizer cancel];
    }
}

#pragma mark - IFlySpeechRecognizerDelegate

/**
 volume callback,range from 0 to 30.
 **/
- (void) onVolumeChanged: (int)volume
{
    if (self.isCanceled) {
        return;
    }

//    NSString * vol = [NSString stringWithFormat:@"%@：%d", NSLocalizedString(@"T_RecVol", nil),volume];
//    [_popUpView showText: vol];
}


/**
 Beginning Of Speech
 **/
- (void) onBeginOfSpeech
{
    NSLog(@"onBeginOfSpeech");
}

/**
 End Of Speech
 **/
- (void) onEndOfSpeech
{
    NSLog(@"onEndOfSpeech");
}


/**
 recognition session completion, which will be invoked no matter whether it exits error.
 error.errorCode =
 0     success
 other fail
 **/
- (void) onCompleted:(IFlySpeechError *) error
{
    NSLog(@"%s",__func__);
    NSString *text ;
    if (self.isCanceled) {
        text = NSLocalizedString(@"T_ISR_Cancel", nil);
    } else if (error.errorCode != 0 ) {
        text = [NSString stringWithFormat:@"Error：%d %@", error.errorCode,error.errorDesc];
        NSDictionary *retDictionary = @{
            @"error" : text
        };
        [_channel invokeMethod:@"onReceiveSpeechText" arguments: retDictionary];
    }
}

/**
 result callback of recognition without view
 results：recognition results
 isLast：whether or not this is the last result
 **/
- (void) onResults:(NSArray *) results isLast:(BOOL)isLast
{
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSDictionary *dic = results[0];
    
    for (NSString *key in dic) {
        [resultString appendFormat:@"%@",key];
    }
    
    NSString * resultFromJson =  nil;
    

    resultFromJson = [ISRDataHelper stringFromJson:resultString];

    
    NSLog(@"resultsFromJson=%@",resultFromJson);
    
    NSDictionary *retDictionary = @{
        @"text" : resultFromJson,
        @"isLast" : [NSNumber numberWithBool:isLast],
        @"type": [NSNumber numberWithInt:1]
    };
    
    [_channel invokeMethod:@"onReceiveSpeechText" arguments: retDictionary];
    
}



/**
 result callback of recognition with view
 resultArray：recognition results
 isLast：whether or not this is the last result
 **/
- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast
{
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    
    for (NSString *key in dic) {
        [resultString appendFormat:@"%@",key];
    }
    
    NSString * resultFromJson =  nil;
    
    resultFromJson = [NSString stringWithFormat:@"%@",resultString];//;[ISRDataHelper stringFromJson:resultString];
    
    NSLog(@"resultFromJson=%@",resultFromJson);
    
    NSDictionary *retDictionary = @{
        @"text" : resultFromJson,
        @"isLast" : [NSNumber numberWithBool:isLast],
        @"type": [NSNumber numberWithInt:2]
    };
    
    [_channel invokeMethod:@"onReceiveSpeechText" arguments: retDictionary];
    
}



/**
 callback of canceling recognition
 **/
- (void) onCancel
{
    NSLog(@"Recognition is cancelled");
}

@end
