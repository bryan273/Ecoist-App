import 'package:ecoist/main/api/home_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FormAddQuestions extends StatefulWidget {
  const FormAddQuestions({Key? key, this.formKey, required this.user})
      : super(key: key);
  final String user;
  final formKey;

  @override
  State<FormAddQuestions> createState() => _FormAddQuestions();
}

class _FormAddQuestions extends State<FormAddQuestions> {
  get formKey => widget.formKey;

  String? question;
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(20.0),
          child: 
            (widget.user != "-") && (widget.user != "ECOIST")
            ?
            Column(children: [
              const Center(
                child: Text(
                  "Have something to ask? Drop your questions below!",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Type your question",
                  labelText: "Question",
                  icon: const Icon(Icons.title),
                  // Menambahkan icon agar lebih intuitif
                  // Menambahkan circular border agar lebih rapi
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),

                onSaved: (String? value) {
                  setState(() {
                    question = value!;
                  });
                },

                // Validator sebagai validasi form
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong!';
                  }
                  question = value;
                  return null;
                },
              )),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    addQuestion(request, question);
                    _controller.clear;
                    //print('---------------------------------------------berhasil');

                  }
                  //print('--------------------------------------------kepencet tapi gagal');
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ])
            :
            Column(children: [
              const Center(
                child: Text(
                  "Have something to ask? Drop your questions below!",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Type your question",
                  labelText: "Question",
                  icon: const Icon(Icons.title),
                  // Menambahkan icon agar lebih intuitif
                  // Menambahkan circular border agar lebih rapi
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),

                onSaved: (String? value) {
                  setState(() {
                    question = value!;
                  });
                },

                // Validator sebagai validasi form
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong!';
                  }
                  question = value;
                  return null;
                },
              )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "login first to submit a question",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ])
        ),
      ),
    );
  }
}
