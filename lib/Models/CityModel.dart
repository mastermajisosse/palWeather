import 'package:flutter/material.dart';
import 'package:taqspalestine/Models/MainModel.dart';

class CityModel {
  //sys
  String name;
  // String countryname;
  double id;
  Color color;
  String country;
  double population;
  double timezone;
  double sunrise;
  double sunset;

  CityModel({
    this.name,
    this.id,
    this.country,
    this.population,
    this.sunrise,
    this.sunset,
    this.timezone,
  });

  CityModel fromJson(Map<String, dynamic> city) {
    return CityModel(
      id: city['id'].toDouble(),
      name: city['name'],
      country: city['country'],
      population: city['population'].toDouble(),
      sunrise: city['sunrise'].toDouble(),
      sunset: city['sunset'].toDouble(),
      timezone: city['timezone'].toDouble(),
    );
  }

  // dateFormat(String format) {
  //   if (dtTxt == null) return '??:??';
  //   DateTime now = DateTime.parse(dtTxt);
  //   String formattedDate = dateFormat(format).format(now);

  //   return formattedDate;
  // }
}
