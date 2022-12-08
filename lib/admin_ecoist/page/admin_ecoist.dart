import 'package:ecoist/landing/components/drawer_admin.dart';
import 'package:flutter/material.dart';
import 'package:ecoist/admin_ecoist/component/form_admin_ecoist.dart';

class AdminEcoistPage extends StatefulWidget {
  const AdminEcoistPage({super.key});

  @override
  State<AdminEcoistPage> createState() => _AdminEcoistState();
}

class _AdminEcoistState extends State<AdminEcoistPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pelayanan Dokter'),
      ),
      drawer: const DrawerAdmin(),
      body: FormAdminEcoist(formKey: _formKey),
    );
  }
}