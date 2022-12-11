class Question {
  Question({
    required this.username,
    required this.question,
  });

  String username = "";
  String question = "";

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        username: json["username"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "question": question,
      };
}