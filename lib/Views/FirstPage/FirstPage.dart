import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/Appb.dart';
import 'package:taqspalestine/Utils/BaseWidget.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/Mydrawer.dart';
import 'package:taqspalestine/Utils/Taqs.dart';
import 'package:taqspalestine/Utils/admob.dart';
import 'package:taqspalestine/Views/FirstPage/BottomB.dart';
import 'package:taqspalestine/Views/FirstPage/PageVieww.dart';
import 'package:taqspalestine/Views/FirstPage/Rightwind.dart';
import 'package:taqspalestine/Views/FirstPage/calendar.dart';
import 'package:taqspalestine/test_connection.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool conected = true;

  var _conectionStatus = 'unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  DateTime date = DateTime.now();

  testCon() {
    connectivity = Connectivity();
    // print("object");
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Conectivety()),
        );
        conected = false;
      }
    });
  }

  BannerAd bannerAd;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;

  var newHour = 19;
  var newM = 01;
  var time;
  Future<void> _demoNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'test ticker');

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSChannelSpecifics);
    // var scheduledNotificationDateTime =
    //     new DateTime.now().add(Duration(seconds: 20));
    time = DateTime.now();
    time = new DateTime(time.year, time.month, time.day, newHour, newM,
        time.second, time.millisecond, time.microsecond);

    await flutterLocalNotificationsPlugin.schedule(
      0,
      'طقس فلسطين',
      'درجة حرارة اليوم في مدينتك هي ' +
          Appconfig.prefs.getDouble('currentTemp').round().toString() +
          " درجة مئوية ",
      time,
      platformChannelSpecifics,
      payload: 'test oayload',
    );
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('Notification payload: $payload');
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstPage()),
    );
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(body),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Ok'),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstPage()));
                  },
                )
              ],
            ));
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    testCon();
    bannerAd = Ads.createBannerAd();
    bannerAd
      ..load()
      ..show(anchorOffset: 0.0, anchorType: AnchorType.bottom);
    initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    _demoNotification();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // print(time);

    return BaseWidget<CitiesProvider>(
        onModelReady: (provider) {
          provider.getCities();
          provider.allTwentyone();
          provider.ini();
        },
        builder: (context, provider, child) => Scaffold(
              key: scaffoldKey,
              appBar: ApBar.appb(
                context,
                scaffoldKey,
              ),
              drawer: MyDrawer.myDrawer(context),
              body: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [MyColo.color_bodyDark, MyColo.color_bodyLight]),
                ),
                child: Stack(
                  children: <Widget>[
                    CalendarWid1(),
                    PageVieww(),
                    RightW(),
                    BottomB(provider.listCities),
                    InkWell(
                      onTap: () async {
                        print(1);

                        await _demoNotification();
                      },
                      child: Container(
                        color: Colors.black,
                        width: 200,
                        height: 50,
                      ),
                    ),
                    conected == false
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Center(
                                child: Text(
                              "الهاتف غير متصل بالأنترنت ..",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26),
                              textDirection: TextDirection.rtl,
                            )),
                          )
                        : Container(),
                  ],
                ),
              ),
            ));
  }
}
