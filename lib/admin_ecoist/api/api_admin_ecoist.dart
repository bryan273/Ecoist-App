import 'package:ecoist/admin_ecoist/model/top_5_user.dart';
import 'package:ecoist/admin_ecoist/model/bar1.dart';
import 'package:ecoist/admin_ecoist/model/bar2.dart';
import 'package:ecoist/admin_ecoist/model/dist1.dart';
import 'package:ecoist/admin_ecoist/model/dist2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
// import 'package:ecoist/admin_ecoist/model/show_log.dart';

// var port = '10.0.2.2';
var port = '127.0.0.1:8000';

Future<List<TopUser>> fetchTopUser(request) async {
  var url = 'http://$port/flutter_top_user/';
  var response = await request.get(url);
  var data = response['table_top_5'];
  print('response ini');
  print(data);
  
  List<TopUser> dataTopUser = [];

  for (var d in data) {
    print('masuk');
    if (d != null) {
      print('json');
      print(d);
      dataTopUser.add(TopUser.fromJson(d));
    }
  }
  return dataTopUser;
}

Future<List<Bar1>> fetchTopDonation(request) async {
  var url = 'http://$port/flutter_top_donations/';
  var response = await request.get(url);
  var data = response['don_top_5'];
  
  List<Bar1> dataBar1 = [];

  for (var d in data) {
    if (d != null) {
      print(d);
      dataBar1.add(Bar1.fromJson(d));
    }
  }
  return dataBar1;
}

Future<List<Bar2>> fetchTopCampaigns(request) async {
  var url = 'http://$port/flutter_top_campaigns/';
  var response = await request.get(url);
  var data = response['par_top_5'];
  
  List<Bar2> dataBar2 = [];

  for (var d in data) {
    if (d != null) {
      print(d);
      dataBar2.add(Bar2.fromJson(d));
    }
  }
  return dataBar2;
}

Future<List<Dist1>> fetchDistDonations(request) async {
  var url = 'http://$port/flutter_dist_donations/';
  var response = await request.get(url);
  var data = response['don_dist'];
  
  List<Dist1> dataDist1 = [];

  for (var d in data) {
    if (d != null) {
      print(d);
      dataDist1.add(Dist1.fromJson(d));
    }
  }
  return dataDist1;
}

Future<List<Dist2>> fetchDistCampaigns(request) async {
  var url = 'http://$port/flutter_dist_campaigns/';
  var response = await request.get(url);
  var data = response['par_dist'];
  
  List<Dist2> dataDist2 = [];

  for (var d in data) {
    if (d != null) {
      print(d);
      dataDist2.add(Dist2.fromJson(d));
    }
  }
  return dataDist2;
}
// addJanji(request, keluhan, noHP, dokter) async {
//   var response = await request.post('http://10.0.2.2:8000/admin_ft/add/',
      // {"keluhan": keluhan, "noHP": noHP, "dokter": dokter}
      // );
  // return response['status'];
// }

// Future<List<ShowLog>> fetchLog(request) async {
//   var url = 'http://10.0.2.2:8000/admin_ft/show_log/';
//   var response = await request.get(url);

//   var data = response;

//   // melakukan konversi data json menjadi object ToDo
//   List<ShowLog> log = [];

//   for (var d in data) {
//     if (d != null) {
//       log.add(ShowLog.fromJson(d));
//     }
//   }
//   return log;
// }