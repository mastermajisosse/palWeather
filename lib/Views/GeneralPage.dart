import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:taqspalestine/Utils/Appb.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/Mydrawer.dart';
import 'package:taqspalestine/Utils/admob.dart';

class GeneralPage extends StatefulWidget {
  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isSwitched = false;
  bool value = false;
  ValueChanged<bool> onChanged;
  Color activeColor = Colors.lightBlue;
  Color disactivatColor = Colors.white70;
  BannerAd bannerAd;
  @override
  void initState() {
    super.initState();
    // Ads.c
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: value ? Alignment.centerRight : Alignment.centerLeft,
            end: value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
    bannerAd = Ads.createBannerAd();
    bannerAd
      ..load()
      ..show(anchorOffset: 0.0, anchorType: AnchorType.bottom);
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      appBar: ApBar.appb(context, scaffoldKey),
      drawer: MyDrawer.myDrawer(context),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColo.color_bodyDark, MyColo.color_bodyLight]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // RaisedButton(
            //     onPressed: () => Ads.hideBannerAd(), child: Container()),
            SizedBox(height: height / 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                swit(),
                Text(
                  "تفعيل الاشعارات",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            SizedBox(height: height / 50),
            Text(
              "قم بتفعيل الاشعارات ليصلك كل ماهو جديد بالنسبة للطقس",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }

  Widget swit() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (value == false) {
              showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                        title: Text(
                          "قم بتفعيل الاشعارات ليصلك كل ماهو جديد بالنسبة للطقس",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: MyColo.color_bodyDark),
                          textDirection: TextDirection.rtl,
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Text(
                                "الغاء",
                                style: TextStyle(
                                    fontSize: 18, color: MyColo.color_bodyDark),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            // SizedBox(width: width / 32),
                            RaisedButton(
                              color: MyColo.color_bodyDark,
                              highlightColor: null,
                              splashColor: null,
                              child: Text(
                                "تم",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () {
                                if (_animationController.isCompleted) {
                                  _animationController.reverse();
                                } else {
                                  _animationController.forward();
                                }
                                ;
                                value = true;
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ));
              // print("false");
            } else if (value == true) {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              // print("true");
              value = false;
            }
          },
          child: Container(
            width: 70.0,
            height: 35.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? disactivatColor
                    : activeColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _circleAnimation.value == Alignment.centerRight
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                      )
                    : Container(),
                Align(
                  alignment: _circleAnimation.value,
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                _circleAnimation.value == Alignment.centerLeft
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
