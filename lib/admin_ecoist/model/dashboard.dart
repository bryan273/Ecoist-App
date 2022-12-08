class Dashboard {
  Dashboard({
    // required this.pk,
    required this.username,
  });

  // int pk = 0;
  String username = "";

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        // pk: json["pk"],
        username: json["fields"]["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        // "pk": pk,
      };
}