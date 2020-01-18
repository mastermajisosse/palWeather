import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Views/FirstPage/FirstPage.dart';

class Conectivety extends StatefulWidget {
  @override
  _ConectivetyState createState() => _ConectivetyState();
}

class _ConectivetyState extends State<Conectivety> {
  var _conectionStatus = 'unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  DateTime date = DateTime.now();

  testCon() {
    connectivity = new Connectivity();
    // print("object");
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => FirstPage()),
        // );
        print("do nothing");
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirstPage()),
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    testCon();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [MyColo.color_bodyDark, MyColo.color_bodyLight]),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.signal_wifi_off,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "الهاتف غير متصل بالأنترنت ..",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )));
  }
}
