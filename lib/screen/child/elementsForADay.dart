import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp3/model/resultWeather.dart';
import 'package:flutterapp3/model/weather.dart';
import 'package:flutterapp3/model/weatherElement.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_icons/weather_icons.dart';

class ElementsForADay extends StatelessWidget {
  final Weather weather;

  const ElementsForADay({
    Key key,
    this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Wrap(
                      spacing: 15.0,
                      children: <Widget>[
                        Text(
                          '${weather.dt_txt.month}/${weather.dt_txt.day}/${weather.dt_txt.year}',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                        Text(
                          'Humidity: ${weather.main.hummylity != null ? weather.main.hummylity : ""}%',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                        Text(
                          '${weather != null ? (weather.main.temp_min - 273.15).toStringAsFixed(2) : 0}° / ${weather != null ? (weather.main.temp_max - 273.15).toStringAsFixed(2) : 0}°',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),

                      ],
                    )
                  ]),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
