import 'package:ecoist/admin_ecoist/api/api_admin_ecoist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class TopUserContainer extends StatefulWidget {
  const TopUserContainer({super.key});

  @override
  State<TopUserContainer> createState() => _TopUserState();
}

class _TopUserState extends State<TopUserContainer> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
      future: fetchTopUser(request),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data.length == 0) {
            return Column(
              children: const [
                Text(
                  "Belum ada user yang melakukan kampanye atau donasi",
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 2.0)
                        ]),
                    child: Center(child: Column(children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Center(child: DefaultTextStyle(
                                    style: const TextStyle(color: Color.fromARGB(255, 206, 40, 46), fontSize: 15,fontWeight: FontWeight.bold),
                                    child: Text("${snapshot.data?[index].index}. ${snapshot.data?[index].username}"),),),]
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Donation Amount	Total Tree	Total Campaign	Total Donation	Notes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [DefaultTextStyle(
                                    style: const TextStyle(color: Color(0xff59A5D8), fontSize: 13,fontWeight: FontWeight.bold),
                                    child: Text("Donation Amount: ${snapshot.data?[index].nominal}",),), 
                                  DefaultTextStyle(
                                    style: const TextStyle(color: Color(0xff59A5D8), fontSize: 13,fontWeight: FontWeight.bold),
                                    child: Text("Total Tree: ${snapshot.data?[index].jumlahPohon}",),),], 
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [DefaultTextStyle(
                                    style: const TextStyle(color: Color(0xff59A5D8), fontSize: 13,fontWeight: FontWeight.bold),
                                    child: Text("Total Campaign: ${snapshot.data?[index].kampanye}",),), 
                                  DefaultTextStyle(
                                    style: const TextStyle(color: Color(0xff59A5D8), fontSize: 13,fontWeight: FontWeight.bold),
                                    child: Text("Total Donation: ${snapshot.data?[index].donasi}",),),], 
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                        Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [DefaultTextStyle(
                                    style: const TextStyle(color: Color(0xff59A5D8), fontSize: 13,fontWeight: FontWeight.bold),
                                    child: Text("Notes: ${snapshot.data?[index].noted}",),),] 
                        ),
                      ),
                    ]),
                    ),
                  ),
            );
          }
        }
      },
    );
  }
}