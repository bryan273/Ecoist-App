// To parse this JSON data, do
//
//     final myWatchList = myWatchListFromJson(jsonString);

import 'dart:convert';

List<Donation> donationFromJson(String str) =>
    List<Donation>.from(json.decode(str).map((x) => Donation.fromJson(x)));

String donationToJson(List<Donation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Donation {
  Donation({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model model;
  int pk;
  Fields fields;

  factory Donation.fromJson(Map<String, dynamic> json) => Donation(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.nominal,
    required this.namaPohon,
    required this.jumlahPohon,
    required this.pesan,
  });

  double nominal;
  String namaPohon;
  double jumlahPohon;
  String pesan;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        nominal: json["nominal"],
        namaPohon: json["namaPohon"],
        jumlahPohon: json["jumlahPohon"],
        pesan: json["pesan"],
      );

  Map<String, dynamic> toJson() => {
        "nominal": nominal,
        "namaPohon": namaPohon,
        "jumlahPohon": jumlahPohon,
        "pesan": pesan,
      };
}

enum Model { DONATION_DONATIONITEM }

final modelValues = EnumValues(
    {"donation.donationitem": Model.DONATION_DONATIONITEM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
