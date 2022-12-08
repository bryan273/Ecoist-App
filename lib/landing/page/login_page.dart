import 'package:ecoist/landing/components/drawer_unlogin.dart';
import 'package:ecoist/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// var port = '10.0.2.2';
var port = '127.0.0.1';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  String username = "";
  String password1 = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    // 'username' and 'password' should be the values of the user login form.

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to your Account"),
      ),
      drawer: const DrawerUnlogin(),
      body: Form(
        key: _loginFormKey,
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Center(
              child: Text("Sign In to Continue"),
            ),
            Padding(
              // Menggunakan padding sebesar 8 pixels
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Username ",
                  icon: const Icon(Icons.title),
                  // Menambahkan icon agar lebih intuitif
                  // Menambahkan circular border agar lebih rapi
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                // Menambahkan behavior saat nama diketik
                onChanged: (String? value) {
                  setState(() {
                    username = value!;
                  });
                },
                // Menambahkan behavior saat data disimpan
                onSaved: (String? value) {
                  setState(() {
                    username = value!;
                  });
                },
                // Validator sebagai validasi form
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              // Menggunakan padding sebesar 8 pixels
              padding: const EdgeInsets.all(8.0),

              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password ",
                  icon: const Icon(Icons.password),
                  // Menambahkan icon agar lebih intuitif
                  // Menambahkan circular border agar lebih rapi
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                // Menambahkan behavior saat nama diketik
                onChanged: (String? value) {
                  setState(() {
                    password1 = value!;
                  });
                },
                // Menambahkan behavior saat data disimpan
                onSaved: (String? value) {
                  setState(() {
                    password1 = value!;
                  });
                },
                // Validator sebagai validasi form
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong!';
                  }
                  return null;
                },
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () async {
                final response =
                    await request.login("http://$port:8000/login/", {
                  'username': username,
                  'password': password1,
                });

                if (request.loggedIn) {
                  if (_loginFormKey.currentState!.validate()) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => response["isAdmin"]
                              ? const MyHomePage(title: "Admin")
                              : const MyHomePage(title: "User"),
                        ));
                  }
                }
              },
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        )),
      ),
    );
  }
}