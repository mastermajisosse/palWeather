import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/Appb.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/Mydrawer.dart';
import 'package:taqspalestine/Utils/Taqs.dart';

class TaqsDetails extends StatefulWidget {
  @override
  _TaqsDetailsState createState() => _TaqsDetailsState();
}

class _TaqsDetailsState extends State<TaqsDetails> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, i) {
            return i == 0
                ? Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          Appconfig.prefs.getString(Appconfig.cityNameArabic),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          width: double.infinity,
                          // height: height / 3,
                          child: Card(
                            color: Colors.white,
                            semanticContainer: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: insid(i),
                          ),
                        ),
                      )
                    ],
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                    child: Container(
                      width: double.infinity,
                      // height: 200,
                      child: Card(
                        color: Colors.white,
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: insid(i),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget insid(i) {
    // i += 1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Provider.of<CitiesProvider>(context).allCities.isEmpty
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Text(
                      Provider.of<CitiesProvider>(context)
                              .listCities[i]
                              .summary +
                          " ، عموما"
                              " درجات حرارة عظمى " +
                          Provider.of<CitiesProvider>(context)
                              .listCities[i]
                              .tempMaxRound() +
                          " درجات مئوية  ،"
                              "ودرجات الحرارة الدنيا " +
                          Provider.of<CitiesProvider>(context)
                              .listCities[i]
                              .tempMinRound() +
                          " درجات مئوية  ،"
                              "الرياح تهب بسرعة تتراوح ما بين " +
                          Provider.of<CitiesProvider>(context)
                              .listCities[i]
                              .windSpeed
                              .toString() +
                          " كلم/ساعة",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.black87),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/icons/cloud.png",
                  width: 60,
                  height: 60,
                ),
                SizedBox(height: 8),
                Text(
                  Provider.of<CitiesProvider>(context).arr[i],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      color: MyColo.color_bodyDark),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 4),
                // Text(
                //   // i.toString() + " - 10 - 2019",
                //   style: TextStyle(
                //       fontSize: 13,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black54),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
