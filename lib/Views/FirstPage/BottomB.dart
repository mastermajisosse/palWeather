import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/getIcons.dart';

class BottomB extends StatefulWidget {
  List proList = List();
  BottomB(this.proList);

  @override
  _BottomBState createState() => _BottomBState();
}

class _BottomBState extends State<BottomB> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Provider.of<CitiesProvider>(context).busy
        ? Container(
            alignment: Alignment.bottomCenter,
            // child: CircularProgressIndicator(),
          )
        : Provider.of<CitiesProvider>(context).listCities.isEmpty
            ? Container()
            : Container(
                height: height / 1.2,
                alignment: Alignment.bottomCenter,
                child: Provider.of<CitiesProvider>(context).butonat == 'd'
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.infinity,
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF212121),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "غروب الشمس \n" +
                                          Provider.of<CitiesProvider>(context)
                                              .botttomChange(widget.proList[0],
                                                  rise: false),
                                      style: TextStyle(
                                          color: Colors.white,
                                          height: 1.2,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow[700],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "شروق الشمس \n" +
                                          Provider.of<CitiesProvider>(context)
                                              .botttomChange(widget.proList[0],
                                                  rise: true),
                                      style: TextStyle(
                                          color: MyColo.color_NavDark,
                                          height: 1.2,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 100,
                        child: ListView.builder(
                            itemCount: 7,
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            itemBuilder: (BuildContext context, int i) {
                              return bottommeth(context, i);
                            }),
                      ),
              );
  }

  Padding bottommeth(BuildContext context, int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            Provider.of<CitiesProvider>(context).arr[i],
            style: TextStyle(
              color: Colors.white,
              height: .5,
              fontSize: 14,
            ),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 4),
          ClipRRect(
            borderRadius: new BorderRadius.circular(100.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue[50],
                      MyColo.color_NavLight,
                    ]),
              ),
              width: 70,
              height: 70,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    left: 15,
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Provider.of<CitiesProvider>(context)
                          .imageChange(getIco(widget.proList[i].icon)),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 15,
                    child: Text(
                      // proList[i].tempMinRound() +
                      //     Provider.of<CitiesProvider>(context).ramzChange(),
                      // '22',
                      Provider.of<CitiesProvider>(context).botttomChange(
                            widget.proList[i],
                            rise: true,
                          ) +
                          "°",
                      style: TextStyle(
                        color: Colors.white,
                        height: .5,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 15,
                    child: Text(
                      Provider.of<CitiesProvider>(context).butonat == 'b' ||
                              Provider.of<CitiesProvider>(context).butonat ==
                                  'c'
                          ? ''
                          : Provider.of<CitiesProvider>(context).botttomChange(
                                widget.proList[i],
                                rise: false,
                              ) +
                              "°",
                      // '22',
                      style: TextStyle(
                          color: Colors.white,
                          height: .5,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
