import 'package:ecoist/landing/components/drawer_unlogin.dart';
import 'package:ecoist/landing/components/register_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Account'),
      ),
      drawer: const DrawerUnlogin(),
      body: RegisterForm(formKey: _formKey),
    );
  }
}