import 'package:flutterapp3/model/city.dart';
import 'package:flutterapp3/model/weather.dart';

class ResultWeather {
  String cod;
  String message;
  int cnt;
  List<Weather> list;
  City city;

  ResultWeather({this.cod, this.message, this.cnt, this.list, this.city});

  factory ResultWeather.fromJson(Map<String, dynamic> json) => ResultWeather(
        cod: json["cod"],
        message: json["message"].toString(),
        cnt: json["cnt"],
        list: List<Weather>.from(json["list"].map((x) => Weather.fromJson(x))),
        // list: null,
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<Map<String, dynamic>>.from(list.map((x) => x.toJson())),
        "city": city.toJson()
      };

  static List<Weather> listFromJson(List<Map<String, dynamic>> jsons) {
    List<Weather> list;
    for (var item in jsons) {
      list.add(Weather.fromJson(item));
    }
    return list;
  }
}
