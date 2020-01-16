import 'package:intl/intl.dart';
import 'package:taqspalestine/Models/MainModel.dart';

class ListModel {
  //weather
  int dt;
  MainModel main;
  double wind;
  String sys;
  String icon;
  String dtTxt;
  String description;
  double all;
  // int rain;

  ListModel(
      {this.dt,
      this.main,
      this.dtTxt,
      this.icon,
      this.description,
      this.all,
      this.wind,
      this.sys}); //,this.sys

  // String dateMin() => DateTime.now().millisecondsSinceEpoch.toString();
  // DateFormat('m').format(DateTime.parse(this.dtTxt)).toString();Md

  String monthDay() =>
      DateFormat('MMMd').format(DateTime.parse(this.dtTxt)).toString();

  String dateHour() =>
      DateFormat('Hm').format(DateTime.parse(this.dtTxt)).toString();

  String dateDay() =>
      DateFormat('yMMMMEEEEd').format(DateTime.parse(this.dtTxt)).toString();

  String dateDayForcast() =>
      DateFormat('E d').format(DateTime.parse(this.dtTxt)).toString();

  String plushours() => DateFormat('Hm')
      .format(DateTime.parse(this.dtTxt).add(new Duration(hours: 2)))
      .toString();

  String plusDay(int i) => DateFormat('E d')
      .format(DateTime.parse(this.dtTxt).add(new Duration(days: i)))
      .toString();

  String justHour() =>
      DateFormat('H').format(DateTime.parse(this.dtTxt)).toString();

  // clearsky(sky){
  //   if(sky = "12"){
  //   }
  //   return sky;
  // }

  ListModel fromJson(Map<String, dynamic> json) {
    return ListModel(
      dt: json['dt'],
      main: MainModel().fromJson(
        json['main'],
      ),
      dtTxt: json['dt_txt'],
      icon: json['weather'][0]['icon'],
      description: json['weather'][0]['description'],
      all: json['clouds']['all'].toDouble(),
      wind: json['wind']["speed"].toDouble(),
      sys: json['sys']['pod'],
    );
  }
}
