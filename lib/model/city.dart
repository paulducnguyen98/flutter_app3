import 'coord.dart';

class City {
  int id;
  String name;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;
  Coord coord;

  City(
      {this.id,
      this.name,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset,
      this.coord});

  factory City.fromJson(Map<String, dynamic> json) => City(
      id: json["id"],
      name: json["name"],
      country: json["country"],
      population: json["population"],
      timezone: json["timezone"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      coord: Coord.fromJson(json["coord"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
        "coord": coord.toJson()
      };
}
