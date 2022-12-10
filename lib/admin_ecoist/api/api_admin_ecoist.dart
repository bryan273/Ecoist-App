import 'package:ecoist/admin_ecoist/model/top_5_user.dart';
import 'package:ecoist/admin_ecoist/model/bar1.dart';
import 'package:ecoist/admin_ecoist/model/bar2.dart';
import 'package:ecoist/admin_ecoist/model/dist1.dart';
import 'package:ecoist/admin_ecoist/model/dist2.dart';
// import 'package:ecoist/admin_ecoist/model/show_log.dart';

// var port = '10.0.2.2';
// var port = '127.0.0.1:8000';

Future<List<TopUser>> fetchTopUser(request) async {
  var url = 'https://ecoist.up.railway.app/flutter_top_user'; 
  // var url = 'http://$port/flutter_top_user/';
  var response = await request.get(url);
  var data = response['table_top_5'];
  // print('response ini');
  // print(data);
  
  List<TopUser> dataTopUser = [];

  for (var d in data) {
    // print('masuk');
    if (d != null) {
      // print('json');
      print(d);
      dataTopUser.add(TopUser.fromJson(d));
    }
  }
  return dataTopUser;
}

Future<List<Bar1>> fetchTopDonation(request) async {
  var url = 'https://ecoist.up.railway.app/flutter_top_donations'; 
  // 'http://$port/flutter_top_donations/';
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
  // var url = 'http://$port/flutter_top_campaigns/';
  var url = 'https://ecoist.up.railway.app/flutter_top_campaigns';
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
  var url = 'https://ecoist.up.railway.app/flutter_dist_donations'; 
  // var url = 'http://$port/flutter_dist_donations/';
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
  var url = 'https://ecoist.up.railway.app/flutter_dist_campaigns'; 
  // var url = 'http://$port/flutter_dist_campaigns/';
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

Future<Map<String, String>> fetchText(request) async {
  // var url = 'http://$port/flutter_text/';
  var url = 'https://ecoist.up.railway.app/flutter_text'; 
  var data = await request.get(url);
  // print(data['username']);
  Map<String, String> map1 = {'username': data['username'],
                          'nominal': data['nominal'],
                          'jumlahPohon': data['jumlahPohon'],
                          'kampanye': data['kampanye'],
                          'donasi': data['donasi'],};
  print(map1['username']);
  return map1;
}

void addNotes(request, nama, note) async {
  await request.post(
      'https://ecoist.up.railway.app/flutter_notes',
      // 'http://$port/flutter_notes/',
      {"nama": nama, "note": note});
}