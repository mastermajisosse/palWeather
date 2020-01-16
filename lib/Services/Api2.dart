import 'dart:async';

import 'package:http/http.dart' as http;

class Api2 {
  static final Api2 _api2 = Api2._internal();

  final String url = "raw.githubusercontent.com";

//
  //6077a3ce319a0b8acd55d08f087660da
  // i need to test = http://api2.openweathermap.org/data/2.5/forecast?q=rabat&appid=081cd11ae3fdedee63c10a027b03dff5&units=metric
  factory Api2() {
    return _api2;
  }
  Api2._internal();

  Future<http.Response> httpGet(String endPath, {Map<String, String> query}) {
    Uri uri = Uri.https(url, "$endPath");
    if (query != null) {
      uri = Uri.https(url, "$endPath", query);
    }
    // print('in api2 file :' + uri.toString());
    return http.get(
      uri,
      headers: {
        'Accept': 'application/json',
      },
    );
  }
}
