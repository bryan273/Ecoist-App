import 'package:ecoist/landing/components/drawer_admin.dart';
import 'package:flutter/material.dart';
import 'package:ecoist/admin_ecoist/component/form_add_notes.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({Key? key, }) : super(key: key);

  @override
  State<AddNotesPage> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotesPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      drawer: const DrawerAdmin(),
      body: FormAddNotes(formKey: _formKey),
    );
  }
}