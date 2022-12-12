import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ecoist/landing/components/drawer_user.dart';
import 'package:ecoist/main.dart';
import 'package:ecoist/campaign/model/campaign.dart';
import 'package:ecoist/campaign/page/campaign_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ecoist/campaign/api/campaign_api.dart';

class CreateCampaignPage extends StatefulWidget{
  const CreateCampaignPage ({Key? key, required String title, }) : super(key: key);

  final String title = "Create Campaign" ;

  @override
  State<CreateCampaignPage> createState() => _CreateCampaignForm();
}

class _CreateCampaignForm extends State <CreateCampaignPage>{

  final _formKey = GlobalKey<FormState>();

  String _judul = "";
  String _deskripsi = "";

    @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer:
      const DrawerUser(),

      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Contoh: Tanamlah Pohon",
                            labelText: "Judul",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              _judul = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _judul = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Judul campaign tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Contoh: Menanam Jagung di Kebun Kita",
                            labelText: "Deskripsi",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              _deskripsi = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _deskripsi = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Deskripsi campaign tidak boleh kosong!';
                              }
                            return null;
                          },
                        ),
                      ),
                      TextButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(80.0, 35.0)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                        onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                addCampaign(request, _judul, _deskripsi);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CampaignPage()),
                          );
                          showDialog(
                            context: context,
                            builder: (_) => const AlertDialog(
                              title: Text('Thank You!'),
                            )
                          );
                         }
                        }, 
                          child: const Text(
                            "Simpan",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal
                          ),
                        ),
                      )
                    ],
                  )
                ),
              )
            ],
          ),
        )
      );
    }
  }