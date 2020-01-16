import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:taqspalestine/Utils/Appb.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/Mydrawer.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String text1 =
      '  نحن مجموعة شباب فلسطينيون شغفون في تطوير تكنولوجيا بلادنا الى ما هو افضل . \n'
      ' فقد قمنا في نهاية عام 2019 باصدار اول نسخة لتطبيق طقس فلسطين الذي نأمل ان يحظى '
      'بإعجابكم وسعي الى افادتكم بكل ما له علاقة في احوال طقس دولتنا الحبيبة';

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: 'MobileId' != null ? <String>['MobileId'] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Mario'],
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-5167234988152277/6098757263",
        //Change BannerAd adUnitId with Admob ID
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    //Change appId With Admob Id
    _bannerAd = createBannerAd()
      ..load()
      ..show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      appBar: ApBar.appb(context, scaffoldKey),
      // bod
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
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/icons/drawer.png",
                width: 100,
                height: 100,
              ),
              // SizedBox(height: height / 50),
              Text(
                "طقس فلسطين",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: height / 40),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text1,
                  style:
                      TextStyle(fontSize: 18, color: Colors.white, height: 1.5),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: height / 50),
            ],
          ),
        ),
      ),
    );
  }
}
