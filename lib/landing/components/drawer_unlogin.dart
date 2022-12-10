import 'package:ecoist/donate/page/donate.dart';
import 'package:ecoist/landing/page/login_page.dart';
import 'package:ecoist/landing/page/register_page.dart';
import 'package:ecoist/donate/page/donate.dart';
import 'package:ecoist/main.dart';

import 'package:flutter/material.dart';

class DrawerUnlogin extends StatelessWidget {
  const DrawerUnlogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: "ECOIST",
                        )),
              );
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Register'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}