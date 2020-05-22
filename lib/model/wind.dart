class Wind {
  double speech;
  int deg;

  Wind({this.speech, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) =>
      Wind(speech: json["speech"], deg: json["deg"]);

  Map<String, dynamic> toJson() => {"speech": speech, "deg": deg};
}
