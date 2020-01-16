class MainModel {
  double temp;
  double tempMin;
  double tempMax;
  double pressure;
  double seaLevel;
  double grndLevel;
  int humidity;
  double tempKf;

  MainModel(
      {this.grndLevel,
      this.humidity,
      this.pressure,
      this.seaLevel,
      this.temp,
      this.tempKf,
      this.tempMax,
      this.tempMin});

  String tempRound() => this.temp.round().toString();
  String tempMinRound() => this.tempMin.round().toString();
  String tempMaxRound() => this.tempMax.round().toString();

  MainModel fromJson(Map<String, dynamic> json) {
    // print(json);
    return json != null
        ? MainModel(
            temp: json['temp'].toDouble(),
            tempMin: json['temp_min'].toDouble(),
            tempMax: json['temp_max'].toDouble(),
            pressure: json['pressure'].toDouble(),
            seaLevel: json['sea_level'].toDouble(),
            grndLevel: json['grnd_level'].toDouble(),
            humidity: json['humidity'],
            tempKf: json['temp_kf'].toDouble(),
          )
        : null;
  }
}
