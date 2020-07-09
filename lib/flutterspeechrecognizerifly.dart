import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

typedef Future<dynamic> EventHandler(Map<String, dynamic> event);

class Flutterspeechrecognizerifly {

  factory Flutterspeechrecognizerifly() => _instance;

  final MethodChannel _channel;

  @visibleForTesting
  Flutterspeechrecognizerifly.private(MethodChannel channel)
      : _channel = channel;

  static final Flutterspeechrecognizerifly _instance =
      new Flutterspeechrecognizerifly.private(const MethodChannel('flutterspeechrecognizerifly'));

  EventHandler _onReceiveSpeechText;

  Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<int> init(String appId) async {
    try{
      int ret = await _channel.invokeMethod('init', {
        "appID": appId
      });
      if(ret == 0) {
        _channel.setMethodCallHandler(_handleMethod);
      }
      return ret;
    }catch(e) {
      print(e);
    }
  }

  Future<Null> _handleMethod(MethodCall call) async {
    print("speech_handleMethod:");

    switch (call.method) {
      case "onReceiveSpeechText":
        return _onReceiveSpeechText(call.arguments.cast<String, dynamic>());
      default:
        throw new UnsupportedError("Unrecognized Event:"+call.method);
    }
  }

  Future<String> start(EventHandler onReceiveSpeechText,{useView = true}) async {
    _onReceiveSpeechText = onReceiveSpeechText;
    try{
      return await _channel.invokeMethod('start', {
        'haveView': useView
      });
    }catch(e) {

    }
  }

  Future<String> stop() async {
    return await _channel.invokeMethod('stop');
  }

  Future<String> cancel() async {
    return await _channel.invokeMethod('cancel');
  }
}
