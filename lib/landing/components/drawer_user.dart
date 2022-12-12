import 'package:ecoist/donate/page/donate-list.dart';
import 'package:ecoist/donate/page/donate.dart';
import 'package:ecoist/landing/api/landing_api.dart';
import 'package:ecoist/participate/page/join_form.dart';
import 'package:ecoist/main.dart';
import 'package:ecoist/participate/page/participants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ecoist/campaign/page/campaign_page.dart';

import '../../participate/page/tes_participants.dart';

class DrawerUser extends StatelessWidget {
  const DrawerUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          const ListTile(
            title: Text(''),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: "Home",
                )),
              );
            },
          ),
          ListTile(
            title: const Text('Campaign'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CampaignPage()),
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