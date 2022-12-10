import 'package:flutter/material.dart';
import 'package:ecoist/landing/components/drawer_user.dart';

class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {

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
  _DataBudgetPageState.daftarNama.add(nama);
  _DataBudgetPageState.daftarEmail.add(email);
  _DataBudgetPageState.daftarNomor.add(nomor);
  _DataBudgetPageState.daftarHelp.add(help);
  _DataBudgetPageState.daftarReason.add(reason);
}