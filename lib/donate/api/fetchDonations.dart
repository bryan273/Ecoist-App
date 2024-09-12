import 'package:ecoist/donate/model/donation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// var port = 'https://ecoist.up.railway.app';
var port = '127.0.0.1:8000';

Future<List<Donation>> fetchDonation() async {
    var url = Uri.parse('$port/donate/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Donation> listDonation = [];

    for (var d in data) {
      if (d != null) {
        listDonation.add(Donation.fromJson(d));
      }
    }
    return listDonation;
  }