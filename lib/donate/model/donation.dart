// To parse this JSON data, do
//
//     final donation = donationFromJson(jsonString);

import 'dart:convert';

List<Donation> donationFromJson(String str) => List<Donation>.from(json.decode(str).map((x) => Donation.fromJson(x)));

String donationToJson(List<Donation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Donation {
    Donation({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Donation.fromJson(Map<String, dynamic> json) => Donation(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        this.campaign,
        required this.nominal,
        required this.jumlahPohon,
        required this.namaPohon,
        required this.pesan,
    });

    int user;
    dynamic campaign;
    int nominal;
    int jumlahPohon;
    String namaPohon;
    String pesan;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        campaign: json["campaign"],
        nominal: json["nominal"],
        jumlahPohon: json["jumlahPohon"],
        namaPohon: json["namaPohon"],
        pesan: json["pesan"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "campaign": campaign,
        "nominal": nominal,
        "jumlahPohon": jumlahPohon,
        "namaPohon": namaPohon,
        "pesan": pesan,
    };
}