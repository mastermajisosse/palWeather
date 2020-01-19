import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/Appb.dart';
import 'package:taqspalestine/Utils/BaseWidget.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/Mydrawer.dart';
import 'package:taqspalestine/Utils/Taqs.dart';
import 'package:taqspalestine/Utils/getIcons.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    conect();
  }

  conect() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      setState(() {
        Provider.of<CitiesProvider>(context, listen: false).busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BaseWidget<CitiesProvider>(
      onModelReady: (provider) {
        provider.getCities();
        provider.ini();
        provider.getHourly();

        // print(provider.listHourly[0].temperature);
      },
      builder: (context, provider, child) => Scaffold(
        key: scaffoldKey,
        appBar: ApBar.appb(context, scaffoldKey),
        drawer: MyDrawer.myDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                // height: height,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [MyColo.color_bodyDark, MyColo.color_bodyLight]),
                ),
                child: Provider.of<CitiesProvider>(context).allCities.isEmpty
                    ? Container(
                        child: Center(
                          child: Center(
                              child: Text(
                            "الهاتف غير متصل بالأنترنت ..",
                            style: TextStyle(color: Colors.white, fontSize: 26),
                            textDirection: TextDirection.rtl,
                          )),
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              width: double.infinity,
                              // height: 300,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: first(provider, height, width),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              // color: Colors.black,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: seconde(provider, height),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "الطقس ساعة بساعة",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, bottom: 10),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFc4ddff),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ListView.builder(
                                  itemCount: 24,
                                  scrollDirection: Axis.horizontal,
                                  reverse: true,
                                  itemBuilder: (context, i) {
                                    return lastt(provider, height, width, i);
                                  }),
                            ),
                          ),

                          // Text((provider.listCities[0].precipProbability * 100).toString()),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  seconde(provider, height) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            child: Text(
              Appconfig.prefs.getString(Appconfig.cityNameArabic) +
                  " - كمية التساقطات والرطوبة",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(7, (index) {
            var i = 6 - index;
            return Text(
              Provider.of<CitiesProvider>(context).arr[i],
              style: TextStyle(color: Colors.white, fontSize: 12),
            );
          }),
        ),
        SizedBox(height: height / 60),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(7, (index) {
              var i = 6 - index;
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    provider.listCities[i].precipPrb() + "%",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      height: 20 +
                          provider.listCities[i].precipProbability *
                              height /
                              10,
                      width: 25,
                      color: MyColo.color_NavLight),
                ],
              );
            }),
          ),
        ),
        // SizedBox(height: height / 60),
      ],
    );
  }

  first(provider, height, width) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            child: Text(
              Appconfig.prefs.getString(Appconfig.cityNameArabic) +
                  " - توقعات الطقس لسبعة ايام",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        Row(
          //tnin tlat larb3 ..
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(7, (index) {
            var i = 6 - index;
            return Text(
              Provider.of<CitiesProvider>(context).arr[i],
              style: TextStyle(color: Colors.white, fontSize: 12),
            );
          }),
        ),
        // SizedBox(height: height / 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(7, (index) {
            return Container(
                width: 24,
                height: 24,
                child: getIco(provider.listCities[index].icon));
          }),
        ),
        // SizedBox(height: height / 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(7, (index) {
            var i = 6 - index;
            return rnd(
              txt: provider.listCities[i].tempMaxRound(),
              tempp: provider.listCities[i].temperatureMax,
            );
          }),
        ),
        // SizedBox(height: height / 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(7, (index) {
            var i = 6 - index;
            return rnd(
              txt: provider.listCities[i].tempMinRound(),
              c: Colors.blue,
              tempp: provider.listCities[i].temperatureMin,
            );
          }),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  rnd({Color c = Colors.red, String txt = '30', tempp = 1}) {
    return Container(
      height: Appconfig.prefs.getString(Appconfig.unit) == 'us'
          ? tempp * 1.3
          : tempp * 5,
      width: 22,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: Appconfig.prefs.getString(Appconfig.unit) == 'us'
                ? tempp / 20
                : tempp,
            // top: tempp / 3,
            left: 0,
            // bottom: 0,
            child: Container(
              width: 22,
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: c, borderRadius: BorderRadius.circular(30)),
              child: Text(
                txt,
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  lastt(provider, height, width, i) {
    return provider.busy
        ? Container(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              children: <Widget>[
                SizedBox(height: height / 90),
                Container(
                    width: 24,
                    height: 24,
                    child: getIco(provider.listHourly[i].icon)),
                SizedBox(height: height / 90),
                Text(
                  i.toString() + ":00",
                  style: TextStyle(fontSize: 13, color: MyColo.color_bodyDark),
                ),
                Text(
                  provider.listHourly[i].tempRound() + "°", // temperature
                  style: TextStyle(fontSize: 18, color: MyColo.color_bodyDark),
                ),
              ],
            ),
          );
  }
}

// max height 170
