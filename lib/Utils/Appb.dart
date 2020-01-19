import 'package:flutter/material.dart';
import 'package:taqspalestine/Utils/MyColo.dart';

class ApBar {
  static Widget appb(
    context,
    scaffoldKey,
  ) =>
      PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [MyColo.color_NavDark, MyColo.color_NavLight]),
              boxShadow: [
                BoxShadow(
                  color: MyColo.color_bodyLight,
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 3, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.clear_all, // menu
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        scaffoldKey.currentState.openDrawer();
                      }),
                ),
                Text(
                  "طقس فلسطين",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    iconSize: 32,
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/city'),
                  ),
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
      );
}
