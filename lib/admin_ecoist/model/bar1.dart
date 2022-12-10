class Bar1 {
  Bar1({
    required this.username,
    required this.nominal,
  });

  String username = "";
  int nominal = 0;

  factory Bar1.fromJson(Map<String, dynamic> json) => Bar1(
        username: json["username"],
        nominal: json["nominal"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "nominal": nominal,
      };
}