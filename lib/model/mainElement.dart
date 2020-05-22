class MainElement {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  int pressure;
  int sea_level;
  int grnd_level;
  int hummylity;
  double temp_kf;

  MainElement(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.sea_level,
      this.grnd_level,
      this.hummylity,
      this.temp_kf});

  factory MainElement.fromJson(Map<String, dynamic> json) => MainElement(
      temp: json["temp"].toDouble(),
      feels_like: json["feels_like"].toDouble(),
      temp_min: json["temp_min"].toDouble(),
      temp_max: json["temp_max"].toDouble(),
      pressure: json["pressure"],
      sea_level: json["sea_level"],
      grnd_level: json["grnd_level"],
      hummylity: json["humidity"],
      temp_kf: json["temp_kf"].toDouble());

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feels_like,
        "temp_min": temp_min,
        "temp_max": temp_max,
        "pressure": pressure,
        "sea_level": sea_level,
        "grnd_level": grnd_level,
        "humidity": hummylity,
        "temp_kf": temp_kf
      };
}
