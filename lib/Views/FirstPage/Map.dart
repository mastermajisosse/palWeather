import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/models/responsive_widgets_model.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/BaseWidget.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/getIcons.dart';

class MapWid extends StatefulWidget {
  int i = 0;
  MapWid(this.i);
  @override
  _MapWidState createState() => _MapWidState(this.i);
}

class _MapWidState extends State<MapWid> {
  int i = 0;
  _MapWidState(this.i);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double w;
    // print(height);
    if (height < 650) {
      w = 0 + 5.0;
    } else {
      w = (width / 50) + 5.0;
    }
    return Provider.of<CitiesProvider>(context).listCities.isEmpty
        ? Container()
        : Provider.of<CitiesProvider>(context).busyAll
            ? Container() //CircularProgressIndicator()
            : Stack(
                children: <Widget>[
                  pos(
                    45 + w,
                    124 + (w / 2),
                    "عكا",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 0, i),
                    img: getIco(
                        Provider.of<CitiesProvider>(context).allCities[i].icon),
                  ),
                  //
                  pos(
                    62 + w,
                    141 + (w / 2),
                    "صفد",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 8, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 8]
                        .icon),
                  ),
                  //
                  pos(
                    77 + w,
                    110 + (w / 2),
                    "حيفا",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 16, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 16]
                        .icon),
                  ),
                  //
                  pos(
                    84 + w * 1.3,
                    130 + (w * 1.2),
                    "الناصرة",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 24, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 24]
                        .icon),
                  ),
                  //
                  pos(
                    106 + w * 1.3,
                    121 + (w / 2),
                    "جنين",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 32, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 32]
                        .icon),
                  ),
                  //
                  pos(
                    115 + w * 1.3,
                    146 + (w / 2),
                    "بيسان",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 40, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 40]
                        .icon),
                  ),
                  //
                  pos(
                    134 + w * 1.3,
                    118 + (w / 2),
                    "طولكرم",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 48, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 48]
                        .icon),
                  ),
                  //
                  pos(
                    141 + w * 1.5,
                    145 + (w / 2),
                    "طوباس",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 56, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 56]
                        .icon),
                  ),
                  //
                  pos(
                    157 + w * 1.5,
                    115 + (w / 2),
                    "قلقيلية",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 64, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 64]
                        .icon),
                  ),
                  //
                  pos(
                    165 + w * 1.5,
                    145 + (w / 2),
                    "نابلس",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 72, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 72]
                        .icon),
                  ),
                  //
                  pos(
                    177 + w * 2,
                    113 + (w / 2),
                    "سلفيت",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 80, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 80]
                        .icon),
                  ),
                  //
                  pos(
                    170 + (w * 1.5),
                    85 + (w / 2),
                    "يافا",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 88, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 88]
                        .icon),
                  ),
                  //
                  pos(
                    187 + w * 2,
                    150 + (w / 2),
                    "اريحا",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 96, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 96]
                        .icon),
                  ),
                  //
                  pos(
                    196 + w * 2.5,
                    118 + (w / 2),
                    "رام الله",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 104, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 104]
                        .icon),
                  ),
                  //
                  pos(
                    215 + (w * 3),
                    117,
                    "القدس",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 112, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 112]
                        .icon),
                  ),
                  //
                  pos(
                    215 + (w * 3),
                    59 + (w / 2),
                    "غزة",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 120, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 120]
                        .icon),
                  ),
                  //
                  pos(
                    238 + (w * 3),
                    40 - (w / 2),
                    "خان يونس",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 128, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 128]
                        .icon),
                  ),
                  //
                  pos(
                    239 + (w * 3),
                    103 - (w / 3),
                    "بيت لحم",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 136, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 136]
                        .icon),
                  ),
                  //
                  pos(
                    280 + (w * 3),
                    49,
                    "رفح",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 144, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 144]
                        .icon),
                  ),
                  //
                  pos(
                    275 + (w * 3),
                    120,
                    "الخليل",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 152, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 152]
                        .icon),
                  ),
                  //
                  pos(
                    295 + (w * 3.5),
                    95,
                    "بئر السبع",
                    temp: swii(
                        Provider.of<CitiesProvider>(context).butonat, 160, i),
                    img: getIco(Provider.of<CitiesProvider>(context)
                        .allCities[i + 160]
                        .icon),
                  ),
                ],
              );
  }

  Widget pos(
    double to,
    double lef,
    cityname, {
    temp = "0",
    img,
  }) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: to,
          left: lef,
          child: Container(
            child: Text(
              cityname == null ? '' : cityname,
              style: TextStyle(
                color: Colors.black87,
                height: 1,
                fontWeight: FontWeight.bold,
                fontSize: 8,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        Positioned(
          top: to - 15,
          left: lef,
          child: Stack(
            children: <Widget>[
              Container(
                width: 15,
                child: Provider.of<CitiesProvider>(context).imageChange(img),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  temp + Provider.of<CitiesProvider>(context).ramzChange(),
                  style: TextStyle(
                    color: Provider.of<CitiesProvider>(context).colorChange(),
                    height: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  swii(but, n, i) {
    switch (but) {
      case 'b':
        return Provider.of<CitiesProvider>(context)
            .allCities[i + n]
            .windspeed();
        break;
      case 'c':
        return Provider.of<CitiesProvider>(context)
            .allCities[i + n]
            .precipPrb();
      default:
        return Provider.of<CitiesProvider>(context)
                .allCities[i + n]
                .tempMaxRound() +
            " " +
            Provider.of<CitiesProvider>(context)
                .allCities[i + n]
                .tempMinRound();
    }
  }
  // Widget posico(double to, double lef, txt) {
  //   return ;
  // }
}
