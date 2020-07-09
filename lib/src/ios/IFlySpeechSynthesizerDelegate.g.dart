// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import, unused_local_variable, dead_code, unnecessary_cast
//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:xftts_fluttify/src/ios/ios.export.g.dart';
import 'package:xftts_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:foundation_fluttify/foundation_fluttify.dart';

mixin IFlySpeechSynthesizerDelegate on NSObject {
  

  

  

  @mustCallSuper
  Future<void> onCompleted(IFlySpeechError error) {
    kNativeObjectPool.add(error);
  
    if (fluttifyLogEnabled) {
      debugPrint('onCompleted::kNativeObjectPool: $kNativeObjectPool');
    }
  }
  
  @mustCallSuper
  Future<void> onSpeakBegin() {
  
  
    if (fluttifyLogEnabled) {
      debugPrint('onSpeakBegin::kNativeObjectPool: $kNativeObjectPool');
    }
  }
  
  @mustCallSuper
  Future<void> onBufferProgress_message(int progress, String msg) {
  
  
    if (fluttifyLogEnabled) {
      debugPrint('onBufferProgress_message::kNativeObjectPool: $kNativeObjectPool');
    }
  }
  
  @mustCallSuper
  Future<void> onSpeakProgress_beginPos_endPos(int progress, int beginPos, int endPos) {
  
  
    if (fluttifyLogEnabled) {
      debugPrint('onSpeakProgress_beginPos_endPos::kNativeObjectPool: $kNativeObjectPool');
    }
  }
  
  @mustCallSuper
  Future<void> onSpeakPaused() {
  
  
    if (fluttifyLogEnabled) {
      debugPrint('onSpeakPaused::kNativeObjectPool: $kNativeObjectPool');
    }
  }
  
  @mustCallSuper
  Future<void> onSpeakResumed() {
  
  
    if (fluttifyLogEnabled) {
      debugPrint('onSpeakResumed::kNativeObjectPool: $kNativeObjectPool');
    }
  }
  
  @mustCallSuper
  Future<void> onSpeakCancel() {
  
  
    if (fluttifyLogEnabled) {
      debugPrint('onSpeakCancel::kNativeObjectPool: $kNativeObjectPool');
    }
  }
  
  @mustCallSuper
  Future<void> onEvent_arg0_arg1_data(int eventType, int arg0, int arg1, NSData eventData) {
    kNativeObjectPool.add(eventData);
  
    if (fluttifyLogEnabled) {
      debugPrint('onEvent_arg0_arg1_data::kNativeObjectPool: $kNativeObjectPool');
    }
  }
  
}