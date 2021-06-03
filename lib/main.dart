import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:async';
import 'package:wakelock/wakelock.dart';
import 'dart:collection';
// import 'dart:convert';
import 'dart:io';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Refresher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Social Refresher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Timer _timerForInter;
  InAppWebViewController webViewController;
  int counter=0;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,

      ),
      android: AndroidInAppWebViewOptions(
        geolocationEnabled: false,
        hardwareAcceleration: true,

        clearSessionCache: true,


      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  int randomNumber;
  String tempUrl;

  @override
  void initState() {

    Wakelock.enable();
    _timerForInter = Timer.periodic(Duration(seconds: 25), (result) {
      crockProxy();

    });
    super.initState();
  }


  proxyscrape(){
    String url="https://proxyscrape.com/web-proxy/proxyrequest";

    var random = new Random();

    randomNumber=random.nextInt(100);
    setState(() {
      tempUrl="${url}";
    });

    var postData = Uint8List.fromList(utf8.encode("url=https://www.dextools.io/app/uniswap/pair-explorer/0x6a0d8a35cda1f0d3534a346394661ed02e9a4072"));
    webViewController.postUrl(url:url, postData: postData);
    counter=counter+1;

    print("este es ---- proxyscrepe");

  }


  crockProxy(){
    String url="https://www.croxyproxy.com/_es/servers";

    var random = new Random();

    randomNumber=random.nextInt(100);
    setState(() {
      tempUrl="${url}?rand=${randomNumber}";
    });

    var postData = Uint8List.fromList(utf8.encode("url=https://www.dextools.io/app/uniswap/pair-explorer/0x6a0d8a35cda1f0d3534a346394661ed02e9a4072"));
    webViewController.postUrl(url:tempUrl, postData: postData);
    counter=counter+1;

    print("este es ----  crockproxy");

  }


  @override
  void dispose() {
    // Add these to dispose to cancel timer when user leaves the app
    _timerForInter.cancel();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: InAppWebView(
       // initialOptions: options,

        initialUrl: "https://www.dextools.io/app/uniswap/pair-explorer/0x6a0d8a35cda1f0d3534a346394661ed02e9a4072",


        onWebViewCreated: (controller) {
          webViewController=controller;

        },
      )
    );
  }
}
