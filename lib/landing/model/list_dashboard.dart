class Dashboard {
  Dashboard({
    required this.pk,
    required this.keluhan,
    required this.tanggalJanji,
    required this.username,
  });

  int pk = 0;
  String keluhan = "";
  String? username;
  String? tanggalJanji;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        pk: json["pk"],
        keluhan: json["fields"]["keluhan"],
        tanggalJanji: json["fields"]["tanggal_janji"],
        username: json["fields"]["username"],
      );

  Map<String, dynamic> toJson() => {
        "keluhan": keluhan,
        "pk": pk,
        "username": username,
        "tanggalJanji": tanggalJanji,
      };
}