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
import 'package:ecoist/campaign/page/create_campaign_form.dart';

import '../../participate/page/tes_participants.dart';
import 'package:ecoist/landing/components/drawer_campaign.dart';

class DrawerCampaign extends StatelessWidget {
  const DrawerCampaign({Key? key}) : super(key: key);

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
            title: const Text('Create Campaign'),
            onTap: () {
              // Route menu ke halaman utama
              logout(request);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateCampaignPage(
                      title: 'Create Campaign'
                  )
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Join Campaign'),
            onTap: () {
              // Route menu ke halaman utama
              logout(request);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ParticipatePage(
                  )
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Donate'),
            onTap: () {
              // Route menu ke halaman utama
              logout(request);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyDonatePage(
                  )
                ),
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