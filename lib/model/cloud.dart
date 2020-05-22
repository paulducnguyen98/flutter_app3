class Cloud {
  int all;

  Cloud({this.all});

  factory Cloud.fromJson(Map<String, dynamic> json) => Cloud(all: json["all"]);

  Map<String, dynamic> toJson() => {"all": all};
}
