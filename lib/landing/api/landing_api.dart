// var port = '10.0.2.2';
var port = '127.0.0.1:8000';

register(request, username, password, password1) async {
  final response = await request.post(
      // 'http://$port/register/',
      'https://ecoist.up.railway.app/register/',
      {"username": username, "password": password, "password1": password1});
  return response['status'];
}

logout(request) async {
  // var url = 'http://$port/logout/';
  var url = 'https://ecoist.up.railway.app/flutter_logout/';
  var response = await request.get(url);

  return response;
}