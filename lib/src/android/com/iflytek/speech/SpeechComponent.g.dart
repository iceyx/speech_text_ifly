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

class com_iflytek_speech_SpeechComponent extends java_lang_Object  {
  //region constants
  static const String name__ = 'com.iflytek.speech.SpeechComponent';

  
  //endregion

  //region creators
  static Future<com_iflytek_speech_SpeechComponent> create__String(String var1) async {
    final int refId = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('ObjectFactory::createcom_iflytek_speech_SpeechComponent__String', {"var1": var1});
    final object = com_iflytek_speech_SpeechComponent()..refId = refId..tag__ = 'xftts_fluttify';
  
    kNativeObjectPool.add(object);
    return object;
  }
  
  static Future<List<com_iflytek_speech_SpeechComponent>> create_batch__String(List<String> var1) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
    final List resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('ObjectFactory::create_batchcom_iflytek_speech_SpeechComponent__String', [for (int __i__ = 0; __i__ < var1.length; __i__++) {"var1": var1[__i__]}]);
  
    final List<com_iflytek_speech_SpeechComponent> typedResult = resultBatch.map((result) => com_iflytek_speech_SpeechComponent()..refId = result..tag__ = 'xftts_fluttify').toList();
    kNativeObjectPool.addAll(typedResult);
    return typedResult;
  }
  
  //endregion

  //region getters
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  Future<String> getPackageName() async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.speech.SpeechComponent@$refId::getPackageName([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.speech.SpeechComponent::getPackageName', {"refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  Future<List<String>> getEngines() async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.speech.SpeechComponent@$refId::getEngines([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.speech.SpeechComponent::getEngines', {"refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = (__result__ as List).cast<String>();
    
      return __return__;
    }
  }
  
  
  Future<void> addEngine(String var1) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.speech.SpeechComponent@$refId::addEngine([\'var1\':$var1])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.speech.SpeechComponent::addEngine', {"var1": var1, "refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  Future<bool> isEngineAvaible(String var1) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.speech.SpeechComponent@$refId::isEngineAvaible([\'var1\':$var1])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.speech.SpeechComponent::isEngineAvaible', {"var1": var1, "refId": refId});
  
  
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

extension com_iflytek_speech_SpeechComponent_Batch on List<com_iflytek_speech_SpeechComponent> {
  //region getters
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  Future<List<String>> getPackageName_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.speech.SpeechComponent::getPackageName_batch', [for (int __i__ = 0; __i__ < this.length; __i__++) {"refId": this[__i__].refId}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<String>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  Future<List<List<String>>> getEngines_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.speech.SpeechComponent::getEngines_batch', [for (int __i__ = 0; __i__ < this.length; __i__++) {"refId": this[__i__].refId}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<List<String>>().map((__result__) => (__result__ as List).cast<String>()).toList();
    
      return typedResult;
    }
  }
  
  
  Future<List<void>> addEngine_batch(List<String> var1) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.speech.SpeechComponent::addEngine_batch', [for (int __i__ = 0; __i__ < this.length; __i__++) {"var1": var1[__i__], "refId": this[__i__].refId}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<String>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  Future<List<bool>> isEngineAvaible_batch(List<String> var1) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.speech.SpeechComponent::isEngineAvaible_batch', [for (int __i__ = 0; __i__ < this.length; __i__++) {"var1": var1[__i__], "refId": this[__i__].refId}]);
  
  
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