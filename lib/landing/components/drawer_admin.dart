import 'package:ecoist/admin_ecoist/page/add_notes.dart';
import 'package:ecoist/landing/api/landing_api.dart';
import 'package:ecoist/main.dart';
import 'package:ecoist/admin_ecoist/page/admin_ecoist.dart';
import 'package:ecoist/admin_ecoist/page/top_user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class DrawerAdmin extends StatelessWidget {
  const DrawerAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: Column(
        children: [
          const ListTile(
            title: Text(''),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AdminEcoistPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Top User'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TopUserPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Notes'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNotesPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Route menu ke halaman utama
              logout(request);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: "-",
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}