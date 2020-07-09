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

class IFlyAudioSession extends NSObject  {
  //region constants
  static const String name__ = 'IFlyAudioSession';

  
  //endregion

  //region creators
  static Future<IFlyAudioSession> create__() async {
    final int refId = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('ObjectFactory::createIFlyAudioSession');
    final object = IFlyAudioSession()..refId = refId..tag__ = 'xftts_fluttify';
  
    kNativeObjectPool.add(object);
    return object;
  }
  
  static Future<List<IFlyAudioSession>> create_batch__(int length) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
    final List resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('ObjectFactory::create_batchIFlyAudioSession', {'length': length});
  
    final List<IFlyAudioSession> typedResult = resultBatch.map((result) => IFlyAudioSession()..refId = result..tag__ = 'xftts_fluttify').toList();
    kNativeObjectPool.addAll(typedResult);
    return typedResult;
  }
  
  //endregion

  //region getters
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  static Future<void> initPlayingAudioSession(bool isMPCenter) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: IFlyAudioSession::initPlayingAudioSession([\'isMPCenter\':$isMPCenter])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('IFlyAudioSession::initPlayingAudioSession', {"isMPCenter": isMPCenter});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<bool> initRecordingAudioSession() async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: IFlyAudioSession::initRecordingAudioSession([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('IFlyAudioSession::initRecordingAudioSession', );
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  //endregion
}

extension IFlyAudioSession_Batch on List<IFlyAudioSession> {
  //region getters
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  static Future<List<void>> initPlayingAudioSession_batch(List<bool> isMPCenter) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('IFlyAudioSession::initPlayingAudioSession_batch', [for (int __i__ = 0; __i__ < isMPCenter.length; __i__++) {"isMPCenter": isMPCenter[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<String>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<bool>> initRecordingAudioSession_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('IFlyAudioSession::initRecordingAudioSession_batch', );
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<bool>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  //endregion
}