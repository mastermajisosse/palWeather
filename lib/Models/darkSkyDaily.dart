// Generated by https://quicktype.io

class DarkSkyDaily {
  int time;
  String summary;
  String icon;
  double sunriseTime;
  double sunsetTime;
  double moonPhase;
  double precipIntensity;
  double precipIntensityMax;
  int precipIntensityMaxTime;
  double precipProbability;
  String precipType;
  double temperatureHigh;
  int temperatureHighTime;
  double temperatureLow;
  int temperatureLowTime;
  double apparentTemperatureHigh;
  int apparentTemperatureHighTime;
  double apparentTemperatureLow;
  int apparentTemperatureLowTime;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windGustTime;
  int windBearing;
  int cloudCover;
  int uvIndex;
  int uvIndexTime;
  int visibility;
  double ozone;
  double temperatureMin;
  int temperatureMinTime;
  double temperatureMax;
  int temperatureMaxTime;
  double apparentTemperatureMin;
  int apparentTemperatureMinTime;
  double apparentTemperatureMax;
  int apparentTemperatureMaxTime;

  DarkSkyDaily({
    this.time,
    this.summary,
    this.icon,
    this.sunriseTime,
    this.sunsetTime,
    this.moonPhase,
    this.precipIntensity,
    this.precipIntensityMax,
    this.precipIntensityMaxTime,
    this.precipProbability,
    this.precipType,
    this.temperatureHigh,
    this.temperatureHighTime,
    this.temperatureLow,
    this.temperatureLowTime,
    this.apparentTemperatureHigh,
    this.apparentTemperatureHighTime,
    this.apparentTemperatureLow,
    this.apparentTemperatureLowTime,
    this.dewPoint,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windGust,
    this.windGustTime,
    this.windBearing,
    this.cloudCover,
    this.uvIndex,
    this.uvIndexTime,
    this.visibility,
    this.ozone,
    this.temperatureMin,
    this.temperatureMinTime,
    this.temperatureMax,
    this.temperatureMaxTime,
    this.apparentTemperatureMin,
    this.apparentTemperatureMinTime,
    this.apparentTemperatureMax,
    this.apparentTemperatureMaxTime,
  });

  String tempRound() => this.temperatureHigh.round().toString();
  String tempMinRound() => this.temperatureMin.round().toString();
  String tempMaxRound() => this.temperatureMax.round().toString();
  String humiditY() => this.humidity.round().toString();
  String windspeed() => this.windSpeed.round().toString();
  String precipPrb() => (this.precipProbability * 100).round().toString();

  DarkSkyDaily fromJson(Map<String, dynamic> json) {
    return DarkSkyDaily(
      temperatureMin: json['temperatureMin'].toDouble(),
      temperatureMax: json['temperatureMax'].toDouble(),
      temperatureHigh: json['temperatureHigh'].toDouble(), // hadi hya temp
      humidity: json['humidity'].toDouble(),
      icon: json['icon'],
      windSpeed: json['windSpeed'].toDouble(),
      precipProbability: json['precipProbability'].toDouble(),
      sunriseTime: json['sunriseTime'].toDouble(),
      sunsetTime: json['sunsetTime'].toDouble(),
      summary: json['summary'],
    );
  }
}
