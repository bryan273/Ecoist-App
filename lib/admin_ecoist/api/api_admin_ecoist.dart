import 'package:ecoist/admin_ecoist/model/dashboard.dart';
// import 'package:ecoist/admin_ecoist/model/show_log.dart';

Future<List<Dashboard>> fetchDashboard(request) async {
  var url = 'http://10.0.2.2:8000/admin_ft/show_doc/';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<Dashboard> dataDashboard = [];

  for (var d in data) {
    if (d != null) {
      dataDashboard.add(Dashboard.fromJson(d));
    }
  }
  return dataDashboard;
}

addJanji(request, keluhan, noHP, dokter) async {
  var response = await request.post('http://10.0.2.2:8000/admin_ft/add/',
      // {"keluhan": keluhan, "noHP": noHP, "dokter": dokter}
      );
  // return response['status'];
}

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