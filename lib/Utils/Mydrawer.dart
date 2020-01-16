import 'package:flutter/material.dart';
import 'package:taqspalestine/Utils/admob.dart';

class MyDrawer {
  static Widget myDrawer(context) => Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: Image.asset("assets/icons/drawer.png",
                          fit: BoxFit.fitHeight),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "طقس فلسطين",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              txt(
                  "assets/icons/drawer2.png",
                  "الطقس بالخريطة",
                  () => Navigator.pushReplacementNamed(context, '/')
                          .then((value) {
                        Ads.hideBannerAd();
                      })),
              txt("assets/icons/calendar.png", "الطقس بالتفصيل",
                  () => Navigator.pushReplacementNamed(context, '/detail')),
              txt("assets/icons/graph.png", "الرسوم البيانية",
                  () => Navigator.pushReplacementNamed(context, '/graph')),
              txt("assets/icons/notif.png", "الاشعارات",
                  () => Navigator.pushReplacementNamed(context, '/notif')),
              txt("assets/icons/location.png", "مدينتك",
                  () => Navigator.pushReplacementNamed(context, '/city')),
              txt("assets/icons/task.png", "الخيارات العامة",
                  () => Navigator.pushReplacementNamed(context, '/general')),
              txt("assets/icons/hand.png", "معلومات عن التطبيق",
                  () => Navigator.pushReplacementNamed(context, '/about')),
            ],
          ),
        ),
      );

  static Widget txt(String stri, String onwan, Function ont) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            child: Image.asset(
              stri,
              width: 40,
              height: 40,
            ),
          ),
          trailing: Text(
            onwan,
            style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w,
                color: Colors.black87),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          onTap: ont,
        ),
      );
}
