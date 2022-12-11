import 'package:flutter/material.dart';
import 'package:ecoist/landing/components/drawer_user.dart';

class InputParticipants extends StatefulWidget {
  const InputParticipants({Key? key, }) : super(key: key);

  @override
  State<InputParticipants> createState() => _InputParticipantsState();
}

class _InputParticipantsState extends State<InputParticipants> {

  // Daftar-daftar data yang disimpan
  static List<String> daftarNama = [];
  static List<String> daftarEmail = [];
  static List<int> daftarNomor = [];
  static List<String> daftarHelp = [];
  static List<String> daftarReason = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Partisipan'),
      ),

      drawer: const DrawerUser(),

      body:ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:[

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            daftarNama[index], style: const TextStyle(fontSize: 25),
                            textAlign: TextAlign.left),
                      ),
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(daftarEmail[index].toString(), style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(daftarNomor[index].toString(), style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(daftarHelp[index], style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(daftarReason[index], style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                        ]
                    ),
                  ],
                )
            ),
          );
        },
        itemCount: daftarNama.length,
      ),
    );
  }
}

void inputDataBudget(String nama, String email, int nomor, String help, String reason){
  _InputParticipantsState.daftarNama.add(nama);
  _InputParticipantsState.daftarEmail.add(email);
  _InputParticipantsState.daftarNomor.add(nomor);
  _InputParticipantsState.daftarHelp.add(help);
  _InputParticipantsState.daftarReason.add(reason);
}