import 'dart:convert';
import 'package:flutterapp3/model/resultWeather.dart';
import 'package:http/http.dart' as http;

class OpenWeatherService {
  Future<ResultWeather> getWeatherByCityName(String city) async {
    String apiURL =
        'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=8ffe0d0cb2340c1272372561e517b7da';
    http.Response response = await http.get(apiURL);
    return ResultWeather.fromJson(json.decode(response.body));
  }
}
