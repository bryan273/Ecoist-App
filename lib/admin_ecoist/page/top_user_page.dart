import 'package:ecoist/landing/components/drawer_admin.dart';
import 'package:ecoist/admin_ecoist/component/top_user_container.dart';
import 'package:flutter/material.dart';

class TopUserPage extends StatefulWidget {
  const TopUserPage({super.key});

  @override
  State<TopUserPage> createState() => _TopUserState();
}

class _TopUserState extends State<TopUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 5 Users'),
      ),
      drawer: const DrawerAdmin(),
      body: const TopUserContainer(),
    );
  }
}