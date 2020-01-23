import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/Taqs.dart';
import 'package:taqspalestine/Views/FirstPage/Map.dart';
import 'package:taqspalestine/Views/FirstPage/calendar.dart';

class PageVieww extends StatefulWidget {
  @override
  _PageViewwState createState() => _PageViewwState();
}

class _PageViewwState extends State<PageVieww> {
  String myCityAr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (Appconfig.prefs.getString(Appconfig.cityNameArabic) == null) {
    //   Appconfig.prefs.setString(Appconfig.cityNameArabic, "رام الله");
    // }
    myCityAr = Appconfig.prefs.getString(Appconfig.cityNameArabic);
  }

  var pages = [
    Centerr(0),
    Centerr(1),
    Centerr(2),
    Centerr(3),
    Centerr(4),
    Centerr(5),
    Centerr(6),
  ];

  PageController pageController = PageController();

  var page = 0.0;

  void _updateIndicator(int pageNumber) {
    setState(() {
      page = pageNumber.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    bool w;
    if (height < 650) {
      w = true;
    } else {
      w = false;
    }
    // String citym = Provider.of<CitiesProvider>(context).myCityAr;
    return Stack(
      children: <Widget>[
        PageView.builder(
          itemCount: pages.length,
          onPageChanged: (page) {
            _updateIndicator(page);
          },
          itemBuilder: (context, index) {
            return pages[index];
          },
        ),
        Container(
          height: w ? height / 1.49 : height / 1.47,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Provider.of<CitiesProvider>(context).listCities.isEmpty
                  ? Container()
                  : Text(
                      Appconfig.prefs
                              .getDouble('currentTemp')
                              .round()
                              .toString() +
                          "°C",
                      style: TextStyle(
                        color: Colors.white,
                        height: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
              DotsIndicator(
                dotsCount: pages.length,
                position: page,
                decorator: DotsDecorator(
                  color: Colors.white,
                  activeColor: Colors.yellow,
                  spacing: EdgeInsets.symmetric(horizontal: 5),
                  size: Size(15, 15),
                  activeSize: Size(14, 14),
                ),
              ),
              Text(
                myCityAr,
                style: TextStyle(
                  color: Colors.white,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Centerr extends StatelessWidget {
  int i;
  Centerr(this.i);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: Container(
            // width: width / 1,
            width: 200,
            height: height / 1.3,
            decoration: BoxDecoration(
              // color: Colors.black,
              image: DecorationImage(
                image: ExactAssetImage(
                  "assets/icons/map.png",
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
            alignment: Alignment.center,
            child: MapWid(i),
          ),
        ),
        CalendarWid2(i),
      ],
    );
  }
}
