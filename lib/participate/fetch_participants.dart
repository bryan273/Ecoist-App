import 'package:ecoist/participate/page/tes_participants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecoist/participate/model/participation.dart';

import 'package:ecoist/landing/components/drawer_user.dart';


Future<List<Participants>> fetchMyWatchList() async {
  var url =
  Uri.parse('http://127.0.0.1:8000/participate/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Participants> listNamaPartisipan = [];

  for (var d in data) {
    if (d != null) {
      listNamaPartisipan.add(Participants.fromJson(d));
    }
  }
  return listNamaPartisipan;
}