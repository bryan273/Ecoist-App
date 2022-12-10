class Dist2 {
  Dist2({
    required this.kampanye,
  });

  int kampanye = 0;

  factory Dist2.fromJson(Map<String, dynamic> json) => Dist2(
        kampanye: json["kampanye"],
      );

  Map<String, dynamic> toJson() => {
        "kampanye": kampanye,
      };
}