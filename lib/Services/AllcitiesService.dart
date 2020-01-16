import 'dart:convert';

import 'package:taqspalestine/Models/CityModel.dart';
import 'package:taqspalestine/Models/ListModel.dart';
import 'package:taqspalestine/Models/darkSkyDaily.dart';
import 'package:taqspalestine/Services/Api.dart';
import 'package:taqspalestine/Services/Api2.dart';
import 'package:taqspalestine/Utils/Taqs.dart';

class Allcitiesdata {
  static final Allcitiesdata listService = Allcitiesdata._internal();
  Allcitiesdata._internal();

  factory Allcitiesdata() {
    return listService;
  }

  // Api api = Api();
  Api2 api2 = Api2();

  List listModel;
  List<CityModel> cities = new List();
  String dd = '';

  // Future all21() async {
  //   listModel = List();
  //   // print(Appconfig.allcities.join(','));
  //   for (var city in Appconfig.allcities) {
  //     await api
  //         .httpGet('forecast/6077a3ce319a0b8acd55d08f087660da/' + city, query: {
  //       'exclude': 'minutely,hourly,flags,currently',
  //       'units': Appconfig.prefs.getString(Appconfig.unit),
  //       'lang': 'ar',
  //     }).then((reponse) {
  //       var data = jsonDecode(reponse.body);
  //       var daily = data["daily"]['data'];
  //       // print(daily);
  //       dd += daily.toString();
  //       // printWrapped(daily.toString());
  //       daily.forEach((l) {
  //         listModel.add(DarkSkyDaily().fromJson(l));
  //       });
  //     });
  //   }
  //   return listModel;
  // }

  Future all21() async {
    listModel = List();
    await api2
        .httpGet('mastermajisosse/PalWeat/master/json.json')
        .then((reponse) {
      var data = jsonDecode(reponse.body);
      data.forEach((l) {
        listModel.add(DarkSkyDaily().fromJson(l));
      });
    });
    return listModel;
  }
}
