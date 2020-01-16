import 'dart:convert';

import 'package:taqspalestine/Models/ListModel.dart';
import 'package:taqspalestine/Services/Api.dart';

class ListService {
  static final ListService listService = ListService._internal();
  ListService._internal();

  factory ListService() {
    // hada tay7m ola ma 3rf
    return listService;
  }

  Api api = Api();

  ListModel listModel = new ListModel();
  List<ListModel> lists;

  Future<List<ListModel>> getLists(String city, units) async {
    lists = new List();
    await api.httpGet('data/2.5/forecast', query: {
      'q': city.toString(),
      // 'appid': api.appId.toString(),
      'units': units.toString()
    }).then((reponse) {
      var data = jsonDecode(reponse.body);
      print(data);
      // print();
      data['list'].forEach((l) {
        lists.add(ListModel().fromJson(l));
      });
      // print(lists);
    });
    return lists;
  }
}
