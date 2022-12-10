class TopUser {
  TopUser({
    required this.index,
    required this.username,
    required this.nominal,
    required this.jumlahPohon,
    required this.kampanye,
    required this.donasi,
    required this.noted,
  });

  int index = 0;
  String username = "";
  int nominal = 0;
  int jumlahPohon = 0;
  int kampanye = 0;
  int donasi = 0;
  String noted = "";

  factory TopUser.fromJson(Map<String, dynamic> json) => TopUser(
        index: json["index"],
        username: json["username"],
        nominal: json["nominal"],
        jumlahPohon: json["jumlahPohon"],
        kampanye: json["kampanye"],
        donasi: json["donasi"],
        noted: json["noted"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "username": username,
        "nominal": nominal,
        "jumlahPohon": jumlahPohon,
        "kampanye": kampanye,
        "donasi": donasi,
        "noted": noted,
      };
}