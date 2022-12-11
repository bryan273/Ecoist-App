import 'package:ecoist/donate/api/fetchDonations.dart';
import 'package:ecoist/landing/components/drawer_user.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class DonateList extends StatefulWidget {
  const DonateList({
    Key? key,
  }) : super(key: key);

  @override
  State<DonateList> createState() => _DonateListState();
}

class _DonateListState extends State<DonateList> {
  @override
  Widget build(BuildContext context) {
    // final request = context.watch<CookieRequest>();
    return Scaffold(
    drawer: DrawerUser(),
    body: FutureBuilder(
      future: fetchDonation(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data.length == 0) {
            return Column(
              children: const [
                Text(
                  "Belum ada donasi",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            // ini harus diubah jadi return listview builder
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (_, index) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 2.0)
                    ]),
                child: Center(
                  child: Column(children: [
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 206, 40, 46),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                child: Text(
                                    "IDR " + "${snapshot.data?[index].fields.nominal}" + " and " + "${snapshot.data?[index].fields.jumlahPohon}" + "x " + "${snapshot.data?[index].fields.namaPohon}"),
                              ),
                            ),
                          ]),
                    ),
                  ]),
                ),
              ),
            );
          }
        }
      },
    )
    );
  }
}
