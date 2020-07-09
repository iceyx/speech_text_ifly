package com.tengits.flutterspeechrecognizerifly;

import android.Manifest;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.InitListener;
import com.iflytek.cloud.RecognizerListener;
import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechRecognizer;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.cloud.ui.RecognizerDialog;
import com.iflytek.cloud.ui.RecognizerDialogListener;

import org.json.JSONException;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterspeechrecognizeriflyPlugin */
public class FlutterspeechrecognizeriflyPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  private final static String TAG = FlutterspeechrecognizeriflyPlugin.class.getSimpleName();
  private final static  int REQUEST_CODE = 123;
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private WeakReference<Activity> mActivity;
  private RecognizerDialog mIatDialog;
  private SpeechRecognizer mIat;

  private String mEngineType = SpeechConstant.TYPE_CLOUD;
  private String resultType = "json";

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutterspeechrecognizerifly");
    channel.setMethodCallHandler(this);
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutterspeechrecognizerifly");
    channel.setMethodCallHandler(new FlutterspeechrecognizeriflyPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;
      case "init":
        initSpeechUtility(call, result);
        break;
      case "start":
        start(call, result);
        break;
      case "stop":
        stop(call, result);
        break;
      case "cancel":
        cancel(call, result);
        break;
      default:
        result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);

    if( null != mIat ){
      // 退出时释放连接
      mIat.cancel();
      mIat.destroy();
    }
  }

  private void initSpeechUtility(final MethodCall call, final Result result) {
    final String appId = call.argument("appID");
    new Handler(Looper.getMainLooper()).post(new Runnable() {
      @Override
      public void run() {
        // Call the desired channel message here.
        SpeechUtility.createUtility(mActivity.get(), "appid=" + appId);
        final ResultStateful resultStateful = ResultStateful.of(result);
        //直接把两种全部初始化
        mIatDialog = new RecognizerDialog(mActivity.get(), new InitListener() {
          @Override
          public void onInit(int code) {
            if (code != ErrorCode.SUCCESS) {
              resultStateful.error("初始化失败", ""+code, null);
            } else {
              resultStateful.success(0);
            }
          }
        });

        mIat = SpeechRecognizer.createRecognizer(mActivity.get(), new InitListener() {
          @Override
          public void onInit(int code) {
            if (code == ErrorCode.SUCCESS) {
              setParam();
              resultStateful.success(0);
            } else {
              resultStateful.error("初始化失败", ""+code, null);
            }
          }
        });
      }
    });
  }

  private void start(MethodCall call, final Result result) {
    final boolean haveView = call.argument("haveView");
    if (mActivity == null) {
      Log.e(TAG, "Ignored start, current activity is null.");
      result.error("Ignored start, current activity is null.", null, null);
    }
    String permissions[] = {Manifest.permission.RECORD_AUDIO,
            Manifest.permission.ACCESS_NETWORK_STATE,
            Manifest.permission.INTERNET,
            Manifest.permission.WRITE_EXTERNAL_STORAGE
    };

    ArrayList<String> toApplyList = new ArrayList<String>();

    for (String perm :permissions){
      if (PackageManager.PERMISSION_GRANTED != ContextCompat.checkSelfPermission(mActivity.get(), perm)) {
        toApplyList.add(perm);
      }
    }
    String tmpList[] = new String[toApplyList.size()];
    if (!toApplyList.isEmpty()){
      ActivityCompat.requestPermissions(mActivity.get(), toApplyList.toArray(tmpList), REQUEST_CODE);
      result.error("request permissons.", null, null);
    } else {
      if(haveView) {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
          @Override
          public void run() {
            // Call the desired channel message here.
            mIatDialog.setListener(mRecognizerDialogListener);

            mIatDialog.show();
            //获取字体所在的控件，设置为"",隐藏字体，
            TextView txt = (TextView)mIatDialog.getWindow().getDecorView().findViewWithTag("textlink");
            if(txt != null) {
              txt.setText("");
            }
            result.success(0);
          }
        });
      } else {
        int ret = mIat.startListening(mRecognizerListener);
        if (ret != ErrorCode.SUCCESS) {
          result.error("start listen error", ""+ret, null);
        } else {
          result.success(0);
        }
      }
    }
  }

  private RecognizerListener mRecognizerListener = new RecognizerListener() {

    @Override
    public void onBeginOfSpeech() {
      // 此回调表示：sdk内部录音机已经准备好了，用户可以开始语音输入
    }

    @Override
    public void onError(SpeechError error) {
      // Tips：
      // 错误码：10118(您没有说话)，可能是录音机权限被禁，需要提示用户打开应用的录音权限。
      Map ret = new HashMap();
      ret.put("error", error.getPlainDescription(true));
      channel.invokeMethod("onReceiveSpeechText", ret);
    }

    @Override
    public void onEndOfSpeech() {
      // 此回调表示：检测到了语音的尾端点，已经进入识别过程，不再接受语音输入
    }

    @Override
    public void onResult(RecognizerResult results, boolean isLast) {
      Log.d(TAG, results.getResultString());
      String retString = "";
      if (resultType.equals("json")) {
        retString = formatResult(results);
      }else if(resultType.equals("plain")) {
        retString = results.getResultString();
      }
      Map ret = new HashMap();
      ret.put("text", retString);
      ret.put("isLast", isLast);
      ret.put("type", 1);

      channel.invokeMethod("onReceiveSpeechText", ret);
    }

    @Override
    public void onVolumeChanged(int volume, byte[] data) {
      Log.d(TAG, "返回音频数据："+data.length);
    }

    @Override
    public void onEvent(int eventType, int arg1, int arg2, Bundle obj) {
      // 以下代码用于获取与云端的会话id，当业务出错时将会话id提供给技术支持人员，可用于查询会话日志，定位出错原因
      // 若使用本地能力，会话id为null
      //	if (SpeechEvent.EVENT_SESSION_ID == eventType) {
      //		String sid = obj.getString(SpeechEvent.KEY_EVENT_SESSION_ID);
      //		Log.d(TAG, "session id =" + sid);
      //	}
    }
  };

  public void setParam() {
    // 清空参数
    mIat.setParameter(SpeechConstant.PARAMS, null);

    // 设置听写引擎
    mIat.setParameter(SpeechConstant.ENGINE_TYPE, mEngineType);
    // 设置返回结果格式
    mIat.setParameter(SpeechConstant.RESULT_TYPE, resultType);


    //此处用于设置dialog中不显示错误码信息
    //mIat.setParameter("view_tips_plain","false");

    // 设置语音前端点:静音超时时间，即用户多长时间不说话则当做超时处理
    mIat.setParameter(SpeechConstant.VAD_BOS, "4000");

    // 设置语音后端点:后端点静音检测时间，即用户停止说话多长时间内即认为不再输入， 自动停止录音
    mIat.setParameter(SpeechConstant.VAD_EOS, "1000");

    // 设置标点符号,设置为"0"返回结果无标点,设置为"1"返回结果有标点
    mIat.setParameter(SpeechConstant.ASR_PTT, "1");

    // 设置音频保存路径，保存音频格式支持pcm、wav，设置路径为sd卡请注意WRITE_EXTERNAL_STORAGE权限
    //mIat.setParameter(SpeechConstant.AUDIO_FORMAT,"wav");
    //mIat.setParameter(SpeechConstant.ASR_AUDIO_PATH, Environment.getExternalStorageDirectory()+"/msc/iat.wav");
  }

  private void stop(MethodCall call, MethodChannel.Result result) {
    if(mIat != null) {
      mIat.stopListening();
    }
  }

  private void cancel(MethodCall call, MethodChannel.Result result) {
    if(mIat != null) {
      mIat.cancel();
    }
  }

  private RecognizerDialogListener mRecognizerDialogListener = new RecognizerDialogListener() {
    public void onResult(RecognizerResult results, boolean isLast) {
      Map ret = new HashMap();
      ret.put("text", formatResult(results));
      ret.put("isLast", isLast);
      ret.put("type", 1);

      channel.invokeMethod("onReceiveSpeechText", ret);
    }

    /**
     * 识别回调错误.
     */
    public void onError(SpeechError error) {
      Map ret = new HashMap();
      ret.put("error", error.getPlainDescription(true));
      channel.invokeMethod("onReceiveSpeechText", ret);
    }
  };

  private String formatResult(RecognizerResult results) {
    String text = JsonParser.parseIatResult(results.getResultString());

    String sn = null;
    // 读取json结果中的sn字段
    try {
      JSONObject resultJson = new JSONObject(results.getResultString());
      sn = resultJson.optString("sn");
    } catch (JSONException e) {
      e.printStackTrace();
    }

    HashMap<String, String> iatResult = new LinkedHashMap<String, String>();

    iatResult.put(sn, text);

    StringBuffer resultBuffer = new StringBuffer();
    for (String key : iatResult.keySet()) {
      resultBuffer.append(iatResult.get(key));
    }

    return resultBuffer.toString();
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    mActivity = new WeakReference<>(activityPluginBinding.getActivity());
    activityPluginBinding.addRequestPermissionsResultListener(new PluginRegistry.RequestPermissionsResultListener() {
      @Override
      public boolean onRequestPermissionsResult(int i, String[] permissions, int[] grantResults) {
        if(i == REQUEST_CODE) {
          for (int ret :grantResults){
            if (ret != PackageManager.PERMISSION_GRANTED) {
              //进入到这里代表没有权限.
              Toast.makeText(mActivity.get(), "请先开通语音权限", Toast.LENGTH_SHORT).show();
              return false;
            }
          }
          return false;
        }
        return true;
      }
    });
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    mActivity = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }
}
