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

class com_iflytek_msc_AIMIC extends java_lang_Object  {
  //region constants
  static const String name__ = 'com.iflytek.msc.AIMIC';

  static final String DEF_LIBNAME_C = "aimic";
  //endregion

  //region creators
  static Future<com_iflytek_msc_AIMIC> create__() async {
    final int refId = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('ObjectFactory::createcom_iflytek_msc_AIMIC__');
    final object = com_iflytek_msc_AIMIC()..refId = refId..tag__ = 'xftts_fluttify';
  
    kNativeObjectPool.add(object);
    return object;
  }
  
  static Future<List<com_iflytek_msc_AIMIC>> create_batch__(int length) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
    final List resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('ObjectFactory::create_batchcom_iflytek_msc_AIMIC__', {'length': length});
  
    final List<com_iflytek_msc_AIMIC> typedResult = resultBatch.map((result) => com_iflytek_msc_AIMIC()..refId = result..tag__ = 'xftts_fluttify').toList();
    kNativeObjectPool.addAll(typedResult);
    return typedResult;
  }
  
  //endregion

  //region getters
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  static Future<void> loadLibrary(String var0) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::loadLibrary([\'var0\':$var0])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::loadLibrary', {"var0": var0});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<bool> isLoaded() async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::isLoaded([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::isLoaded', );
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<bool> isValid() async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::isValid([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::isValid', );
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<int> getHandler() async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::getHandler([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::getHandler', );
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<int> AIMICNew(Uint8List var0, com_iflytek_msc_AIMIC_Listener var1) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICNew([\'var0\':$var0])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICNew', {"var0": var0});
  
  
    // handle native call
    MethodChannel('com.iflytek.msc.AIMIC::AIMICNew::Callback')
        .setMethodCallHandler((methodCall) async {
          final args = methodCall.arguments as Map;
          // final refId = args['callerRefId'] as int;
          // if (refId != this.refId) return;
  
          switch (methodCall.method) {
            case 'Callback::com.iflytek.msc.AIMIC.Listener::onWakeupAudio':
              // print log
              if (fluttifyLogEnabled) {
                print('fluttify-dart-callback: onWakeupAudio([\'var1\':${args['var1']}, \'var2\':${args['var2']}, \'var3\':${args['var3']}, \'var4\':${args['var4']}])');
              }
        
              // handle the native call
              var1?.onWakeupAudio(args['var1'], args['var2'], args['var3'], args['var4']);
              break;
            case 'Callback::com.iflytek.msc.AIMIC.Listener::onRecogAudio':
              // print log
              if (fluttifyLogEnabled) {
                print('fluttify-dart-callback: onRecogAudio([\'var1\':${args['var1']}, \'var2\':${args['var2']}, \'var3\':${args['var3']}, \'var4\':${args['var4']}])');
              }
        
              // handle the native call
              var1?.onRecogAudio(args['var1'], args['var2'], args['var3'], args['var4']);
              break;
            case 'Callback::com.iflytek.msc.AIMIC.Listener::onWakeupMsg':
              // print log
              if (fluttifyLogEnabled) {
                print('fluttify-dart-callback: onWakeupMsg([\'var1\':${args['var1']}, \'var2\':${args['var2']}, \'var3\':${args['var3']}, \'var4\':${args['var4']}, \'var5\':${args['var5']}, \'var6\':${args['var6']}, \'var7\':${args['var7']}, \'var8\':${args['var8']}, \'var9\':${args['var9']}])');
              }
        
              // handle the native call
              var1?.onWakeupMsg(args['var1'], args['var2'], args['var3'], args['var4'], args['var5'], args['var6'], args['var7'], args['var8'], args['var9']);
              break;
            default:
              break;
          }
        });
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<int> AIMICAudioWrite(int var0, Uint8List var2, int var3, int var4) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICAudioWrite([\'var0\':$var0, \'var2\':$var2, \'var3\':$var3, \'var4\':$var4])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICAudioWrite', {"var0": var0, "var2": var2, "var3": var3, "var4": var4});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<int> AIMICResetEng(int var0) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICResetEng([\'var0\':$var0])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICResetEng', {"var0": var0});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<int> AIMICDestroy(int var0) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICDestroy([\'var0\':$var0])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICDestroy', {"var0": var0});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<int> AIMICSetParam(int var0, Uint8List var2, Uint8List var3) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICSetParam([\'var0\':$var0, \'var2\':$var2, \'var3\':$var3])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICSetParam', {"var0": var0, "var2": var2, "var3": var3});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<int> AIMICGetParam(int var0, Uint8List var2, Uint8List var3) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICGetParam([\'var0\':$var0, \'var2\':$var2, \'var3\':$var3])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICGetParam', {"var0": var0, "var2": var2, "var3": var3});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<Uint8List> AIMICGetVersion() async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICGetVersion([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICGetVersion', );
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__ as Uint8List;
    
      return __return__;
    }
  }
  
  
  static Future<void> AIMICDebugLog(bool var0, int var1) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICDebugLog([\'var0\':$var0, \'var1\':$var1])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICDebugLog', {"var0": var0, "var1": var1});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = __result__;
    
      return __return__;
    }
  }
  
  
  static Future<int> AIMICGetChannel() async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.iflytek.msc.AIMIC::AIMICGetChannel([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICGetChannel', );
  
  
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

extension com_iflytek_msc_AIMIC_Batch on List<com_iflytek_msc_AIMIC> {
  //region getters
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  static Future<List<void>> loadLibrary_batch(List<String> var0) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::loadLibrary_batch', [for (int __i__ = 0; __i__ < var0.length; __i__++) {"var0": var0[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<String>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<bool>> isLoaded_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::isLoaded_batch', );
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<bool>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<bool>> isValid_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::isValid_batch', );
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<bool>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<int>> getHandler_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::getHandler_batch', );
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<int>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<int>> AIMICAudioWrite_batch(List<int> var0, List<Uint8List> var2, List<int> var3, List<int> var4) async {
    if (var0.length != var2.length || var2.length != var3.length || var3.length != var4.length) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICAudioWrite_batch', [for (int __i__ = 0; __i__ < var0.length; __i__++) {"var0": var0[__i__], "var2": var2[__i__], "var3": var3[__i__], "var4": var4[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<int>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<int>> AIMICResetEng_batch(List<int> var0) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICResetEng_batch', [for (int __i__ = 0; __i__ < var0.length; __i__++) {"var0": var0[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<int>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<int>> AIMICDestroy_batch(List<int> var0) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICDestroy_batch', [for (int __i__ = 0; __i__ < var0.length; __i__++) {"var0": var0[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<int>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<int>> AIMICSetParam_batch(List<int> var0, List<Uint8List> var2, List<Uint8List> var3) async {
    if (var0.length != var2.length || var2.length != var3.length) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICSetParam_batch', [for (int __i__ = 0; __i__ < var0.length; __i__++) {"var0": var0[__i__], "var2": var2[__i__], "var3": var3[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<int>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<int>> AIMICGetParam_batch(List<int> var0, List<Uint8List> var2, List<Uint8List> var3) async {
    if (var0.length != var2.length || var2.length != var3.length) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICGetParam_batch', [for (int __i__ = 0; __i__ < var0.length; __i__++) {"var0": var0[__i__], "var2": var2[__i__], "var3": var3[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<int>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<Uint8List>> AIMICGetVersion_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICGetVersion_batch', );
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<Uint8List>().map((__result__) => __result__ as Uint8List).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<void>> AIMICDebugLog_batch(List<bool> var0, List<int> var1) async {
    if (var0.length != var1.length) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICDebugLog_batch', [for (int __i__ = 0; __i__ < var0.length; __i__++) {"var0": var0[__i__], "var1": var1[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<String>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  
  static Future<List<int>> AIMICGetChannel_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('com.iflytek.msc.AIMIC::AIMICGetChannel_batch', );
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<int>().map((__result__) => __result__).toList();
    
      return typedResult;
    }
  }
  
  //endregion
}