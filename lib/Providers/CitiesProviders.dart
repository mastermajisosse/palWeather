import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taqspalestine/Services/AllcitiesService.dart';
import 'package:taqspalestine/Services/DataCityService.dart';
import 'package:taqspalestine/Utils/Taqs.dart';

class CitiesProvider extends ChangeNotifier {
  CitiesProvider();
  DataCityService dataCityService = DataCityService();
  Allcitiesdata _allcitiesdata = Allcitiesdata();
  String myCityGeo;

  String _butonat = 'a';
  get butonat => _butonat;
  set butonat(String b) {
    _butonat = b;
    notifyListeners();
  }

  bool _busy = true;
  get busy => _busy;
  set busy(bool b) => _busy = b;

  bool _busyAll = true;
  get busyAll => _busyAll;
  set busyAll(bool b) => _busyAll = b;

  List _listCities = List();
  get listCities => _listCities;

  List _listHourly = List();
  get listHourly => _listHourly;

  List _allCities = List();
  get allCities => _allCities;

  Future getCities({f: false}) async {
    if (_listCities.isNotEmpty && f == false) return _listCities;
    _listCities.clear();
    print("object");
    if (Appconfig.prefs.getString('cityGeo') == null) {
      print('no');
      Appconfig.prefs.setString(Appconfig.cityNameArabic, "غزة");

      Appconfig.prefs.setString('cityGeo', Appconfig.fuckingAllGeo[0]);
    }
    myCityGeo = Appconfig.prefs.getString('cityGeo'); //num 1 , 2 ..

    busy = true;

    await dataCityService.getLists(myCityGeo).then((data) {
      if (data == null) print("empty list");
      _listCities = data;
      busy = false;
    });
    notifyListeners();
  }

  Future getHourly({f: false}) async {
    if (_listHourly.isNotEmpty && f == false) return _listHourly;
    _listCities.clear();
    busy = true;

    await dataCityService.getHourly(myCityGeo).then((data) {
      if (data == null) print("empty list");
      _listHourly = data;
      busy = false;
    });
    notifyListeners();
  }

  ini() {
    arr = List();
    for (var i = 0; i < 7; i++) {
      arr.add(dayArabic(d(i)));
    }
    hh = hourChek(int.parse(hour));
  }

  allTwentyone() async {
    if (_allCities.isNotEmpty) return _allCities;
    _busyAll = true;

    await _allcitiesdata.all21().then((data) {
      if (data == null) print("empty list");
      _allCities = data;
    });
    _busyAll = false;
    // return _allCities;

    notifyListeners();
  }

  ///

  String day(int n) => DateFormat('d')
      .format(DateTime.now().add(
        Duration(days: n),
      ))
      .toString();

  String d(int n) => DateFormat('EEEE')
      .format(DateTime.now().add(
        Duration(days: n),
      ))
      .toString();
  List<String> arr;
  String hour = DateFormat('kk').format(DateTime.now()).toString();
  String dateHour(h) => DateFormat('Hm').format(DateTime.parse(h)).toString();
  String hh = '';

  String hourChek(hour) {
    if (hour == 18 ||
        hour == 19 ||
        hour == 20 ||
        hour == 21 ||
        hour == 22 ||
        hour == 23 ||
        hour == 24 ||
        hour == 1 ||
        hour == 2 ||
        hour == 2 ||
        hour == 3 ||
        hour == 4 ||
        hour == 5) {
      // hh = ;
      return "ليلا";
    } else if (hour > 13 && hour < 18) {
      // hh = ;
      return "مساءا";
    } else {
      // hh = ;
      return "صباحا";
    }
  }

  String dayArabic(String d) {
    if (d == "Thursday") {
      d = "الخميس";
    } else if (d == "Friday") {
      d = "الجمعة";
    } else if (d == "Saturday") {
      d = "السبت";
    } else if (d == "Sunday") {
      d = "الأحد";
    } else if (d == "Monday") {
      d = "الاتنين";
    } else if (d == "Tuesday") {
      d = "الثلاتاء";
    } else if (d == "Wednesday") {
      d = "الأربعاء";
    }
    return d;
  }

  String tempRound(double temp) => temp.round().toString();

  imageChange(dynamic img) {
    switch (butonat) {
      case 'a':
        return img;
      case 'b':
        return Image.asset("assets/icons/cur.png");
      case 'c':
        return Image.asset("assets/icons/amb.png");
      case 'd':
        return img;
      default:
        return img;
    }
  }

  String ramzChange() {
    switch (butonat) {
      case 'a':
        return "°";
      case 'b':
        return "";
      case 'c':
        return "%";
      case 'd':
        return " ";
      default:
        return "°";
    }
  }

  // DateFormat('Hm').format(DateTime.parse(this.dtTxt)).toString()
// // DateTime.fromMillisecondsSinceEpoch(l.sunriseTime.toInt() * 1000)
//             .toString()
  String botttomChange(l, {rise}) {
    switch (butonat) {
      case 'a':
        return rise ? l.tempMinRound() : l.tempMaxRound();
      case 'b':
        return l.windspeed();
      case 'c':
        return l.precipPrb();
      case 'd':
        return rise
            ? dateHour(DateTime.fromMillisecondsSinceEpoch(
                    l.sunriseTime.toInt() * 1000)
                .toString())
            : dateHour(
                DateTime.fromMillisecondsSinceEpoch(l.sunsetTime.toInt() * 1000)
                    .toString());
    }
  }

  colorChange() {
    switch (butonat) {
      case 'a':
        return Colors.red[700];
      case 'b':
        return Colors.purple;
      case 'c':
        return Colors.blue[900];
      case 'd':
        return Colors.red[700];
      default:
        return Colors.red[700];
    }
  }
}
