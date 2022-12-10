// import 'dart:html';

import 'package:ecoist/main.dart';
import 'package:ecoist/landing/components/drawer_unlogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyDonatePage());
}

class MyDonatePage extends StatefulWidget {
  const MyDonatePage({Key? key, }) : super(key: key);

  @override
  State<MyDonatePage> createState() => _MyDonatePageState();
}

class _MyDonatePageState extends State<MyDonatePage> {
  final _formKey = GlobalKey<FormState>();
  double nominal = 1000;
  String namaPohon = "";
  double jumlahPohon = 1;
  String pesan = "";

  bool isNumeric(String value){
    return double.tryParse(value) != null;
  }

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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Minimal Rp 1000,-",
                                labelText: "Nominal",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                setState(() {
                                  nominal = double.parse(value!);
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  nominal = value! as double;
                                });
                              },
                              // Validator
                              validator: (String? value) {
                                // cek kosong
                                if (value == null || value.isEmpty) {
                                  return 'Isi nominal';
                                }
                                // check isnumeric
                                if (!isNumeric(value)) {
                                  return 'Nominal harus berupa angka';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Contoh: Kaktus",
                                labelText: "Nama Pohon",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  namaPohon = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  namaPohon = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Isi nama pohon';
                                }
                                return null;
                              },
                            ),
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Text('Jumlah Pohon: ${jumlahPohon.round()}'),
                              ],
                            ),
                            subtitle: Slider(
                              value: jumlahPohon,
                              min: 1,
                              max: 100,
                              divisions: 100,
                              label: jumlahPohon.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  jumlahPohon = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              // controller: textarea,
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Pesan untuk kami",
                                labelText: "Pesan",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  namaPohon = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  namaPohon = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Isi pesan';
                                }
                                return null;
                              },
                            ),
                          ),
                          TextButton(
                  child: const Text(
                    "Donasi",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Container(
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Center(child: const Text('Success!')),
                                  SizedBox(height: 20),
                                  Text('Selamat! Anda telah berdonasi sebesar:'),
                                  Text('Nominal: ' + nominal.toString()),
                                  Text('Nama Pohon: ' + namaPohon),
                                  Text('Jumlah Pohon: ' + jumlahPohon.round().toString()),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Kembali',
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                        ]
                      )
                    )
                  )
                )
              );
  }
}
