import 'package:ecoist/participate/fetch_participants.dart';
import 'package:ecoist/landing/components/drawer_user.dart';
import 'package:flutter/material.dart';


class TesParticipants extends StatefulWidget {
  const TesParticipants({Key? key}) : super(key: key);

  @override
  State<TesParticipants> createState() => _TesParticipantsState();
}

class _TesParticipantsState extends State<TesParticipants> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: DrawerUser(),
      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Belum ada partisipan",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    padding: const EdgeInsets.all(20.0),
                    decoration:
                    BoxDecoration(color: Colors.white, boxShadow: [
                    ]),
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: Row(
                        children: [
                          Text(
                            "${snapshot.data![i].fields.namaPendaftar}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }
          }
        },
      ),
    );
  }
}