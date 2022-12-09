import 'package:ecoist/landing/model/list_dashboard.dart';

// var port = '10.0.2.2';
var port = '127.0.0.1:8000';

register(request, username, password, password1) async {
  final response = await request.post('http://$port/register/',
      {"username": username, "password": password, "password1": password1});
  return response['status'];
}

logout(request) async {
  var url = 'http://$port/logout/';
  var response = await request.get(url);

  return true;
}

modifHasil(request, keluhan, pk) async {
  final response = await request.post('http://$port/modif-hasil/',
      {"hasil": keluhan, "peka": pk.toString()});

  return response["status"];
}

Future<List<Dashboard>> fetchDashboard(request) async {
  var url = 'http://$port/list-pasien/';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<Dashboard> dataPasien = [];

  for (var d in data) {
    if (d != null) {
      dataPasien.add(Dashboard.fromJson(d));
    }
  }
  return dataPasien;
}