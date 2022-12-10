import 'package:ecoist/landing/components/drawer_unlogin.dart';
import 'package:ecoist/admin_ecoist/page/admin_ecoist.dart';
import 'package:ecoist/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// var port = '10.0.2.2';
var port = '127.0.0.1:8000';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  String username = "";
  String password = "";
  String? message = "";
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
              child: Text("Sign In to Continue", 
                        style: TextStyle(fontSize: 18),),
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
                // validator: (String? value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Email tidak boleh kosong!';
                //   }
                //   return null;
                // },
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
                    password = value!;
                  });
                },
                // Menambahkan behavior saat data disimpan
                onSaved: (String? value) {
                  setState(() {
                    password = value!;
                  });
                },
                // Validator sebagai validasi form
                // validator: (String? value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Password tidak boleh kosong!';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              // Menggunakan padding sebesar 8 pixels
              padding: const EdgeInsets.all(24.0),
              child:Center (
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 21, 104, 230)),
                  
                ),
                onPressed: () async {
                  final response = await request.post(
                      // 'https://ecoist.up.railway.app/flutter_login',
                      'http://$port/flutter_login/', 
                  {
                    "username": username,
                    "password": password,
                  });
                  
                  print(response);
                  print(response['status']==false);

                  if (response['status']==true) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => response["isAdmin"]
                              ? const AdminEcoistPage()
                              : const MyHomePage(title: "User"),
                        ));
                  } else {
                    setState(() {
                      message = response['message'];
                    });
                  }
                },
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ),
            ),
            Center(
              child: Text(message ?? "",
                          style: const TextStyle(color: Colors.red, fontSize: 16),)),
          ]),
        )),
      ),
    );
  }
}