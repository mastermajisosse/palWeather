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

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    testCon();
    bannerAd = Ads.createBannerAd();
    bannerAd
      ..load()
      ..show(anchorOffset: 0.0, anchorType: AnchorType.bottom);
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
