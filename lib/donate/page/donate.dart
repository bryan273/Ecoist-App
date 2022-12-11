import 'dart:html';
import 'dart:js_util';

import 'package:ecoist/donate/page/donate-list.dart';
import 'package:ecoist/landing/components/drawer_user.dart';
import 'package:ecoist/donate/model/donation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
  int nominal = 1000;
  String namaPohon = "";
  int jumlahPohon = 1;
  String pesan = "";

  bool isNumeric(String value) {
    return int.tryParse(value) != null;
  }

  void donate(request, nominal, namaPohon, jumlahPohon, pesan) async {
    await request.post('http://127.0.0.1:8000/donate/flutter_donation/', {
      "nominal": nominal,
      "namaPohon": namaPohon,
      "jumlahPohon": jumlahPohon,
      "pesan": pesan
    });
    print("masuk kesini");
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Donate'),
        ),
        drawer: const DrawerUser(),
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
                                hintText: "Minimum IDR 1000,-",
                                labelText: "Nominal",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                setState(() {
                                  nominal = int.parse(value!);
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  nominal = value! as int;
                                });
                              },
                              // Validator
                              validator: (String? value) {
                                // cek kosong
                                if (value == null || value.isEmpty) {
                                  return 'Please enter nominal';
                                }
                                // check isnumeric
                                if (!isNumeric(value)) {
                                  return 'Nominal must be a number';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Example: Cactus",
                                labelText: "Tree Name",
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
                                  return 'Please enter tree name';
                                }
                                return null;
                              },
                            ),
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Text('Number of Trees: ${jumlahPohon.round()}'),
                              ],
                            ),
                            subtitle: Slider(
                              value: jumlahPohon.toDouble(),
                              min: 1,
                              max: 100,
                              divisions: 100,
                              label: jumlahPohon.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  jumlahPohon = value as int;
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
                                hintText: "Message for Us",
                                labelText: "Message for Us",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  pesan = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  pesan = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter message';
                                }
                                return null;
                              },
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "Donate",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                donate(
                                  request,
                                  nominal.toString(),
                                  namaPohon,
                                  jumlahPohon.toString(),
                                  pesan,
                                );
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
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            Center(
                                                child: const Text('Success!')),
                                            SizedBox(height: 20, width: 50),
                                            Center(
                                                child: (Text(
                                                    'Congratulations! You have donated IDR ' +
                                                        nominal.toString() +
                                                        ' and ' +
                                                        jumlahPohon
                                                            .round()
                                                            .toString() +
                                                        'x ' +
                                                        namaPohon))),
                                            TextButton(
                                                onPressed: () {
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context) => const DonateList()),);
                                                },
                                                child: Text(
                                                  'Back',
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
                        ])))));
  }
}
