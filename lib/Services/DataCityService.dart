import 'dart:convert';

import 'package:taqspalestine/Models/HourlyModel.dart';
import 'package:taqspalestine/Models/darkSkyDaily.dart';
import 'package:taqspalestine/Services/Api.dart';
import 'package:taqspalestine/Utils/Taqs.dart';

class DataCityService {
  static final DataCityService listService = DataCityService._internal();
  DataCityService._internal();

  factory DataCityService() {
    return listService;
  }
  Api api = Api();

  List listModel;
  List hourModel;
  // List<CityModel> cities = new List();

  Future getLists(dynamic citynum) async {
    listModel = List();

    await api.httpGet('forecast/6077a3ce319a0b8acd55d08f087660da/' + citynum,
        query: {
          'exclude': 'minutely,flags',
          'units': Appconfig.prefs.getString(Appconfig.unit),
          'lang': 'ar',
        }).then((reponse) {
      var data = jsonDecode(reponse.body);
      var temp = data["currently"]['temperature'];
      // print(temp.toString());
      Appconfig.prefs.setDouble('currentTemp', temp);
      var daily = data["daily"]['data'];
      daily.forEach((l) {
        listModel.add(DarkSkyDaily().fromJson(l));
      });
      print(listModel[1].tempMinRound().toString());
    });
    return listModel;
  }

  Future getHourly(citynum) async {
    hourModel = List();
    await api.httpGet('forecast/6077a3ce319a0b8acd55d08f087660da/' + citynum,
        query: {
          'exclude': 'minutely,flags',
          'units': Appconfig.prefs.getString(Appconfig.unit),
          'lang': 'ar',
        }).then((reponse) {
      var data = jsonDecode(reponse.body);
      var daily = data["hourly"]['data'];
      // print(daily[0]);
      daily.forEach((l) {
        hourModel.add(Hourly().fromJson(l));
      });
    });
    return hourModel;
  }
}
