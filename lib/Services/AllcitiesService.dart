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

  Api2 api2 = Api2();

  List listModel;

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
