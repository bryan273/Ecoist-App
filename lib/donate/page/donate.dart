import 'dart:html';

import 'package:ecoist/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyDonatePage());
}

class MyDonatePage extends StatefulWidget {
  const MyDonatePage({super.key});

  @override
  State<MyDonatePage> createState() => _MyDonatePageState();
}

class _MyDonatePageState extends State<MyDonatePage> {
  final _formKey = GlobalKey<FormState>();
  double nominal = 0;
  String namaPohon = "";
  double jumlahPohon = 0;
  String pesan = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.co_present),
                  title: Row(
                    children: [
                      Text('Nominal: ${nominal.round()}'),
                    ],
                  ),
                  subtitle: Slider(
                    value: nominal,
                    max: 100,
                    divisions: 100,
                    label: nominal.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        nominal = value;
                      });
                    },
                  ),
                ),
              ]
            )
          )
        )
      )
    );
  }
}
