import 'package:flutterapp3/model/cloud.dart';
import 'package:flutterapp3/model/mainElement.dart';
import 'package:flutterapp3/model/sys.dart';
import 'package:flutterapp3/model/weatherElement.dart';
import 'package:flutterapp3/model/wind.dart';

class Weather {
  int dt;
  MainElement main;
  List<WeatherElement> weather;
  Cloud cloud;
  Wind wind;
  Sys sys;
  DateTime dt_txt;

  Weather(
      {this.dt,
      this.main,
      this.weather,
      this.cloud,
      this.wind,
      this.sys,
      this.dt_txt});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      dt: json["dt"],
      main: MainElement.fromJson(json["main"]),
      weather: List<WeatherElement>.from(
          json["weather"].map((x) => WeatherElement.fromJson(x))),
      cloud: Cloud.fromJson(json["clouds"]),
      sys: Sys.fromJson(json["sys"]),
      dt_txt: DateTime.parse(json["dt_txt"]));

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather":
            List<Map<String, dynamic>>.from(weather.map((x) => x.toJson())),
        "cloud": cloud.toJson(),
        "wind": wind.toJson(),
        "sys": sys.toJson(),
        "dt_txt": dt_txt.toString()
      };
}
