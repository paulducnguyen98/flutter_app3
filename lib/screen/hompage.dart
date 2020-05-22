import 'package:flutter/material.dart';
import 'package:flutterapp3/constant/Constant.dart';
import 'package:flutterapp3/model/city.dart';
import 'package:flutterapp3/Utils/Util.dart' as Util;
import 'package:flutterapp3/model/resultWeather.dart';
import 'package:flutterapp3/model/weather.dart';
import 'package:flutterapp3/screen/LocWeather.dart';
import 'package:flutterapp3/screen/child/elementsForADay.dart';
import 'package:flutterapp3/screen/child/elementsForAnHour.dart';
import 'package:flutterapp3/services/OpenWeatherService.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ResultWeather reponseWeather = new ResultWeather();
  Weather weather = new Weather();
  List<Weather> lsCurentWeather = new List();
  List<Weather> lsWeatherFor5Day = new List();
  String curentCity;

  Future<ResultWeather> getData() async {
    OpenWeatherService service = OpenWeatherService();
    List<Weather> curentWeathers = new List();
    List<Weather> weatherFor5Days = new List();
    Weather tempWeather = new Weather();
    ResultWeather tempReponseWeather;
    tempReponseWeather = await service.getWeatherByCityName(curentCity);
    for (var i = 0; i < tempReponseWeather.list.length; i++) {
      if (tempReponseWeather.list[i].dt_txt.day == DateTime.now().day) {
        curentWeathers.add(tempReponseWeather.list[i]);
        if (i < tempReponseWeather.list.length - 1) {
          if (tempReponseWeather.list[i].dt_txt.hour <= DateTime.now().hour &&
              tempReponseWeather.list[i + 1].dt_txt.hour >
                  DateTime.now().hour) {
            tempWeather = tempReponseWeather.list[i];
          }
        } else {
          if (weather == null) {
            tempWeather =
                tempReponseWeather.list[tempReponseWeather.list.length - 1];
          }
        }
      } else {
        weatherFor5Days.add(tempReponseWeather.list[i]);
      }
    }
    setState(() {
      this.reponseWeather = tempReponseWeather;
      this.lsCurentWeather = curentWeathers;
      this.lsWeatherFor5Day = weatherFor5Days;
      this.weather = tempWeather;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      curentCity = Util.defaultCity;
    });
    getData();
  }

  void onSelectAction(String choice) async {
    Route route = MaterialPageRoute(builder: (context) => LocWeather());
    final result = await Navigator.push(context, route);
    setState(() {
      curentCity = result;
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (weather.dt != null)
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather forecast application",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
                icon: Icon(Icons.search),
                onSelected: onSelectAction,
                itemBuilder: (BuildContext context) {
                  return Constant.options.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                })
          ],
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: new ConstrainedBox(
              constraints: new BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                  child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            //image: AssetImage('assets/images/.jpg'),
                            image: AssetImage(''),
                            fit: BoxFit.fill,
                            alignment: Alignment.centerRight),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              "${this.reponseWeather != null ? this.reponseWeather.city.name : ""}",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${weather != null ? (weather.main.temp_max - 273.15).toStringAsFixed(2) : 0}' +
                                      '°',
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                    'http://openweathermap.org/img/wn/${weather != null ? weather.weather[0].icon : "04n"}@2x.png'),
                              ],
                            ),
                            SizedBox(height: 15.0),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      DateFormat("EEEE, d MMMM")
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.0),
                                const Divider(
                                  color: Colors.black,
                                  height: 1.0,
                                  thickness: 1.0,
                                  indent: 0.0,
                                  endIndent: 0.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 250.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: this.lsCurentWeather == null
                                  ? 0
                                  : this.lsCurentWeather.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ElementForAnHour(
                                    weather: this.lsCurentWeather[index]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 7.0),
                              const Divider(
                                color: Colors.black,
                                height: 1.0,
                                thickness: 1.0,
                                indent: 0.0,
                                endIndent: 0.0,
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 250.0,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: this.lsWeatherFor5Day == null
                                  ? 0
                                  : (this.lsWeatherFor5Day.length / 8.0).ceil(),
                              itemBuilder: (BuildContext context, int index) {
                                return ElementsForADay(
                                    weather: this.lsWeatherFor5Day[index * 8]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 7.0),
                              const Divider(
                                color: Colors.black,
                                height: 1.0,
                                thickness: 1.0,
                                indent: 0.0,
                                endIndent: 0.0,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
        }),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Duc Nguyen",
                  style: TextStyle(color: Colors.brown),
                ),
                accountEmail: Text(
                  "paulducnguyen98@gmail.com",
                  style: TextStyle(color: Colors.brown),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.home, color: Colors.brown),
                  title: Text(
                    " Home",
                    style: TextStyle(color: Colors.brown),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.settings, color: Colors.brown),
                  title: Text("Setting", style: TextStyle(color: Colors.brown)),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      );
    else
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Weather forecasts Application",
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).copyWith().size.height,
            width: MediaQuery.of(context).copyWith().size.width,
            color: Colors.white,
            child: Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(),
              ),
            ),
          ));
  }
}
