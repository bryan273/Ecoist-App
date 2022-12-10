class Bar2 {
  Bar2({
    required this.username,
    required this.kampanye,
  });

  String username = "";
  int kampanye = 0;

  factory Bar2.fromJson(Map<String, dynamic> json) => Bar2(
        username: json["username"],
        kampanye: json["kampanye"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "kampanye": kampanye,
      };
}