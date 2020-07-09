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

class com_iflytek_cloud_SpeechEvent extends java_lang_Object  {
  //region constants
  static const String name__ = 'com.iflytek.cloud.SpeechEvent';

  static final int EVENT_NETPREF = 10001;
  static final int EVENT_SESSION_ID = 20001;
  static final String KEY_EVENT_SESSION_ID = "session_id";
  static final int EVENT_TTS_BUFFER = 21001;
  static final String KEY_EVENT_TTS_BUFFER = "buffer";
  static final int EVENT_TTS_CANCEL = 21002;
  static final int EVENT_RECORD_DATA = 21003;
  static final String KEY_EVENT_RECORD_DATA = "data";
  static final int EVENT_IVW_RESULT = 22001;
  static final String KEY_EVENT_IVW_RESULT = "rec_result";
  static final int EVENT_SPEECH_START = 22002;
  static final int EVENT_RECORD_STOP = 22003;
  static final int EVENT_AUDIO_URL = 23001;
  static final String KEY_EVENT_AUDIO_URL = "audio_url";
  static final int EVENT_IST_AUDIO_FILE = 10004;
  static final int EVENT_IST_UPLOAD_BYTES = 10006;
  static final int EVENT_IST_CACHE_LEFT = 10007;
  static final String KEY_EVENT_IST_UPLOAD_COMPLETE = "ist_upload_complete";
  static final int EVENT_IST_RESULT_TIME = 10008;
  static final int EVENT_IST_SYNC_ID = 10009;
  static final int EVENT_SESSION_BEGIN = 10010;
  static final int EVENT_SESSION_END = 10011;
  static final int EVENT_VOLUME = 10012;
  static final int EVENT_VAD_EOS = 10013;
  //endregion

  //region creators
  static Future<com_iflytek_cloud_SpeechEvent> create__() async {
    final int refId = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('ObjectFactory::createcom_iflytek_cloud_SpeechEvent__');
    final object = com_iflytek_cloud_SpeechEvent()..refId = refId..tag__ = 'xftts_fluttify';
  
    kNativeObjectPool.add(object);
    return object;
  }
  
  static Future<List<com_iflytek_cloud_SpeechEvent>> create_batch__(int length) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
    final List resultBatch = await MethodChannel('com.fluttify/xftts_fluttify').invokeMethod('ObjectFactory::create_batchcom_iflytek_cloud_SpeechEvent__', {'length': length});
  
    final List<com_iflytek_cloud_SpeechEvent> typedResult = resultBatch.map((result) => com_iflytek_cloud_SpeechEvent()..refId = result..tag__ = 'xftts_fluttify').toList();
    kNativeObjectPool.addAll(typedResult);
    return typedResult;
  }
  
  //endregion

  //region getters
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  //endregion
}

extension com_iflytek_cloud_SpeechEvent_Batch on List<com_iflytek_cloud_SpeechEvent> {
  //region getters
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  //endregion
}