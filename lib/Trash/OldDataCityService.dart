import 'dart:convert';

import 'package:taqspalestine/Models/CityModel.dart';
import 'package:taqspalestine/Models/ListModel.dart';
import 'package:taqspalestine/Services/Api.dart';

class DataCityService {
  static final DataCityService listService = DataCityService._internal();
  DataCityService._internal();

  factory DataCityService() {
    return listService;
  }
  List<String> allcities = [
    '294801',
    // 'Safed',
    '294801',
    '294098',
    '293286',
    "283506",
    '281577',
    '281581',
    // 'Qalqilya',
    '282615',
    '282039',
    '293396',
    '284899',
    '282239',
    '281184',
    '1165789',
    '5180225',
    '281124',
    '324944',
    '285066',
    "4601709",
    // '293322'
  ];

  Api api = Api();

  List listModel;
  List<CityModel> cities = new List();

  Future getLists(String city, units) async {
    listModel = List();
    await api.httpGet('data/2.5/forecast', query: {
      'q': city.toString(),
      // 'appid': api.appId.toString(),
      'units': units.toString()
    }).then((reponse) {
      var data = jsonDecode(reponse.body);
      print(data);
      data["list"].forEach((l) {
        listModel.add(ListModel().fromJson(l));
      });
    });
    return listModel;
  }

  Future getListCity(String city, units) async {
    await api.httpGet('data/2.5/forecast', query: {
      'q': city.toString(),
      // 'appid': api.appId.toString(),
      'units': units.toString()
    }).then((reponse) {
      var data = jsonDecode(reponse.body);
      // print(data['city']);
      cities[0] = CityModel().fromJson(data['city']);
    });
    return cities;
  }

  Future all21(units) async {
    listModel = List();
    print(allcities.join(','));
    await api.httpGet('data/2.5/group', query: {
      'id': allcities.join(','),
      // 'appid': api.appId.toString(),
      'units': units.toString()
    }).then((reponse) {
      var data = jsonDecode(reponse.body);
      print(data);
      data["list"].forEach((l) {
        listModel.add(ListModel().fromJson(l));
      });
    });
    return listModel;
  }
}
