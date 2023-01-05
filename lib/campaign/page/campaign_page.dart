import 'package:ecoist/landing/components/drawer_campaign.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:ecoist/main.dart';
import 'package:ecoist/campaign/model/campaign.dart';
import 'package:ecoist/campaign/page/create_campaign_form.dart';

// var port = 'https://ecoist.up.railway.app';
var port = '127.0.0.1:8000';

class CampaignPage extends StatefulWidget {
  const CampaignPage ({Key? key}) : super(key: key);

  final String title = "Campaign" ;

  @override
  _CampaignPageState createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {

  Future<List<Campaign>> fetchCampaign() async {
    var url = Uri.parse('$port/campaign/json');
    var response = await http.get(
      url,
      headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
      }
    );
      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object ToDo
      List<Campaign> campaign = [];
      for (var d in data) {
        if (d!=null) {
          campaign.add(Campaign.fromJson(d));
        }
      }
    return campaign;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerCampaign(),
    body: FutureBuilder(
        future: fetchCampaign(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "Tidak ada Campaign :(",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index)=> Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0
                      )
                    ]
                  ),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            "${snapshot.data![index].fields['title']}",
                            style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields['description']}",),
                    ],  
                  ),
                )
              );
            }
          }
        }
      )
    );
  }
}