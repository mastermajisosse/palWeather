import 'dart:async';

import 'package:http/http.dart' as http;

class Api {
  static final Api _api = Api._internal();

  // String appId = '081cd11ae3fdedee63c10a027b03dff5';
  // final String url = "api.openweathermap.org";

  final String url = "api.darksky.net";
  // final String url2 = "api.darksky.net";


//https://raw.githubusercontent.com/mastermajisosse/PalWeat/master/json.json
  //6077a3ce319a0b8acd55d08f087660da
  // i need to test = http://api.openweathermap.org/data/2.5/forecast?q=rabat&appid=081cd11ae3fdedee63c10a027b03dff5&units=metric
  factory Api() {
    return _api;
  }
  Api._internal();

  Future<http.Response> httpGet(String endPath, {Map<String, String> query}) {
    Uri uri = Uri.https(url, "$endPath");
    if (query != null) {
      uri = Uri.https(url, "$endPath", query);
    }
    // print('in api file :' + uri.toString());
    return http.get(
      uri,
      headers: {
        'Accept': 'application/json',
      },
    );
  }
}
