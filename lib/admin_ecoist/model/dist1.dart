class Dist1 {
  Dist1({
    required this.nominal,
  });

  int nominal = 0;

  factory Dist1.fromJson(Map<String, dynamic> json) => Dist1(
        nominal: json["nominal"],
      );

  Map<String, dynamic> toJson() => {
        "nominal": nominal,
      };
}