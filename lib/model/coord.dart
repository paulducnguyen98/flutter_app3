class Coord {
  double lat;
  double lon;

  Coord({this.lat, this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {"lat": lat, "lon": lon};
}
