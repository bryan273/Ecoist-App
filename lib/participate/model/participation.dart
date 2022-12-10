// To parse this JSON data, do
//
//     final participants = participantsFromJson(jsonString);

import 'dart:convert';

List<Participants> participantsFromJson(String str) => List<Participants>.from(json.decode(str).map((x) => Participants.fromJson(x)));

String participantsToJson(List<Participants> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Participants {
  Participants({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Participants.fromJson(Map<String, dynamic> json) => Participants(
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
    required this.campaign,
    required this.namaPendaftar,
    required this.emailPendaftar,
    required this.phoneNumber,
    required this.whatCanYouHelpWith,
    required this.reasonToParticipate,
  });

  int user;
  dynamic campaign;
  String namaPendaftar;
  String emailPendaftar;
  String phoneNumber;
  String whatCanYouHelpWith;
  String reasonToParticipate;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    campaign: json["campaign"],
    namaPendaftar: json["nama_pendaftar"],
    emailPendaftar: json["email_pendaftar"],
    phoneNumber: json["phone_number"],
    whatCanYouHelpWith: json["what_can_you_help_with"],
    reasonToParticipate: json["reason_to_participate"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "campaign": campaign,
    "nama_pendaftar": namaPendaftar,
    "email_pendaftar": emailPendaftar,
    "phone_number": phoneNumber,
    "what_can_you_help_with": whatCanYouHelpWith,
    "reason_to_participate": reasonToParticipate,
  };
}
