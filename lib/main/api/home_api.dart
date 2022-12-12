import 'package:ecoist/main/model/question.dart';

//var port = 'http://127.0.0.1:8000';
var port = 'https://ecoist.up.railway.app';

Future<int> fetchCount(request) async {
  var url = '$port/flutter-get-campaign-sum/';
  print('------fetching count');
  final response = await request.get(url);
  print('------function berhasil dengan response ${response[0]["count"]}');

  int data = response[0]["count"];
  return data;
}

Future<String> getLastQuestion(request) async {
  var url = '$port/flutter-get_last_question/';
  final response = await request.get(url);
  final data = response;
  return data;
}

void addQuestion(request, question) async {
  var url = '$port/flutter-submit-question/';
  print('---------------------pertanyaannya adalahhh $question');
  await request.post(url, {"question": question});
}

Future<List<Question>> fetchRecentQuestions(request) async {
  print('fetcing questions.................................');

  var url = '$port/flutter-getrecentquestions/';
  var response = await request.get(url);

  List<Question> dataQuestions = [];

  for (var d in response) {
    // print('masuk');
    if (d != null) {
      // print('json');
      print(d);
      dataQuestions.add(Question.fromJson(d));
    }
  }
  return dataQuestions;
}
