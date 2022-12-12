// To parse this JSON data, do
//
//     final campaign = campaignFromJson(jsonString);

import 'dart:convert';

List<Campaign> campaignFromJson(String str) => List<Campaign>.from(json.decode(str).map((x) => Campaign.fromJson(x)));

String campaignToJson(List<Campaign> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Campaign {
    Campaign({
      required this.model,
      required  this.pk,
      required  this.fields,
    });

    String model;
    int pk;
    Map<String, dynamic>  fields;

    factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        model: json["model"],
        pk: json["pk"],
        fields: json["fields"],
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields,
    };
}
