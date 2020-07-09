import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutterspeechrecognizerifly/flutterspeechrecognizerifly.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Flutterspeechrecognizerifly ifly = Flutterspeechrecognizerifly();
  String _platformVersion = 'Unknown';
  String _recgonizerRet1 = "";
  String _recgonizerRet2 = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await ifly.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: ListView(
              children: <Widget>[
                Text('Running on: $_platformVersion\n'),
                Text('有UI语音识别结果: $_recgonizerRet1\n'),
                Text('无UI语音识别结果: $_recgonizerRet2\n'),
                RaisedButton(
                  onPressed: () async{
                    var ret = await ifly.init("5ed77343");
                    print(ret);
                  },
                  child: Text("初始化", style: TextStyle(fontSize: 14, color: Colors.blue),),
                ),
                RaisedButton(
                  onPressed: () async{
                    ifly.start((Map<String, dynamic> message) async {
                      print("flutter onOpenNotification: $message");
                      setState(() {
                        _recgonizerRet1 += message["text"];
                      });
                    }, useView: true);
                  },
                  child: Text("带UI语音识别", style: TextStyle(fontSize: 14, color: Colors.blue),),
                ),
                RaisedButton(
                  onPressed: () async{
                    ifly.start((Map<String, dynamic> message) async {
                      print("flutter onOpenNotification: $message");
                      setState(() {
                        _recgonizerRet2 += message["text"];
                      });
                    }, useView: false);
                  },
                  child: Text("无UI语音识别", style: TextStyle(fontSize: 14, color: Colors.blue),),
                ),
              ],
            )
        ),
      ),
    );
  }
}
