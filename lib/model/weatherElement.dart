class WeatherElement {
  int id;
  String main;
  String description;
  String icon;

  WeatherElement({this.id, this.main, this.description, this.icon});

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"].toInt(),
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "main": main, "description": description, "icon": icon};
}
