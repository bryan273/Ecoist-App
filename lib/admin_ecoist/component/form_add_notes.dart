import 'package:ecoist/admin_ecoist/api/api_admin_ecoist.dart';
import 'package:ecoist/admin_ecoist/model/top_5_user.dart';
import 'package:ecoist/admin_ecoist/page/top_user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FormAddNotes extends StatefulWidget {
  const FormAddNotes({Key? key, this.formKey}) : super(key: key);

  final formKey;

  @override
  State<FormAddNotes> createState() => _FormAddNotes();
}

class _FormAddNotes extends State<FormAddNotes> {
  get formKey => widget.formKey;

  String? nama;
  String? note;
  List<TopUser>? top;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
        future: fetchTopUser(request),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada data user",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
              top = snapshot.data;
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                    child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                     const Center(
                      child: Text("Add Notes for User", 
                                style: TextStyle(fontSize: 18),),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Masukkan nama anda",
                          labelText: "Nama",
                          icon: const Icon(Icons.title),
                          // Menambahkan icon agar lebih intuitif
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          setState(() {
                            nama = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong!';
                          }
                          nama = value;
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFormField(
                        initialValue: "-",
                        decoration: InputDecoration(
                          hintText: "Masukkan Notes",
                          labelText: "Notes",
                          icon: const Icon(Icons.note),
                          // Menambahkan icon agar lebih intuitif
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            note = value;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Notes tidak boleh kosong!';
                          }
                          note = value;
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          addNotes(request, nama, note);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TopUserPage()),
                          );
                        }
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white,  fontSize: 18),
                      ),
                    )
                  ]),
                )),
              );
            }
          }

        });
  }
}