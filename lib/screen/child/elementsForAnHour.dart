import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp3/model/weather.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_icons/weather_icons.dart';

class ElementForAnHour extends StatelessWidget {
  final Weather weather;

  const ElementForAnHour({
    Key key,
    this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('${weather.dt_txt.hour}h',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0)),
          Image.network(
              'http://openweathermap.org/img/wn/${weather != null ? weather.weather[0].icon : '10d'}@2x.png'),
          SizedBox(
            height: 10.0,
          ),
          RichText(
              text: TextSpan(
                  text:
                      '${weather != null ? (weather.main.temp - 273).toStringAsFixed(0) : 0}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  children: [
                TextSpan(text: "°C"),
              ]))
        ],
      ),
    );
  }
}
