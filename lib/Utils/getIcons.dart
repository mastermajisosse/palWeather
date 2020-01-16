import 'package:flutter/widgets.dart';

Image getIco(String description) {
  switch (description) {
    case 'clear-day':
      return Image.asset("assets/icons/clear.png");
    case 'clear-night':
      return Image.asset("assets/icons/moon.png");
    case 'rain':
      return Image.asset("assets/icons/amb.png");
    case 'sleet':
      return Image.asset("assets/icons/amb.png");
    case 'snow':
      return Image.asset("assets/icons/amb.png");
    case 'wind':
      return Image.asset("assets/icons/wind.png");
    case 'fog':
      return Image.asset("assets/icons/cloudy.png");
    case 'cloudy':
      return Image.asset("assets/icons/cloudy.png");
    case 'partly-cloudy-day':
      return Image.asset("assets/icons/cloud.png");
    case 'partly-cloudy-night':
      return Image.asset("assets/icons/moon.png");
    default:
      return Image.asset("assets/icons/clear.png");
  }
}
