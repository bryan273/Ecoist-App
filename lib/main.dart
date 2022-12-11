// @dart=2.9
import 'package:ecoist/landing/components/drawer_admin.dart';
import 'package:ecoist/landing/components/drawer_user.dart';
import 'package:ecoist/landing/components/drawer_unlogin.dart';
import 'package:ecoist/main/api/home_api.dart';
import 'package:ecoist/main/components/form_add_questions.dart';
import 'package:ecoist/admin_ecoist/page/admin_ecoist.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecoist/landing/page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
          "/admin_ecoist": (BuildContext context) => const AdminEcoistPage(),
          '/home': (BuildContext context) => const MyHomePage(title: "-"),
        },
        initialRoute: "/home",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  int count = 70;
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // fetchCount(request).then((int result) {
    //   setState(() {
    //     count = result;
    //   });
    // });
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
        appBar: AppBar(
          title: const Text("ECOIST"),
        ),
        drawer:
            //const DrawerUser(),
            (widget.title == "-") || (widget.title == "ECOIST")
                ? const DrawerUnlogin()
                : widget.title == "Admin"
                    ? const DrawerAdmin()
                    : const DrawerUser(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/forest.jpg',
                  height: 300,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome to Ecoist,\n where we can create a better world together.',
                  style:  TextStyle(
                                fontSize: 20.0,
                                ),
                  
                ),
                const SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  future: fetchCount(request),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Text(
                        '${snapshot.data}',
                        style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                      );
                    }
                  }
                ),
                const Text(
                  "campaigns have been started in ecoist",
                    style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FormAddQuestions(formKey: _formKey, user: widget.title),
                const SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  future: fetchRecentQuestions(request),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.data.length == 0) {
                        return Column(
                          children: const [
                            Text(
                              "0 question have been asked",
                              style: TextStyle(
                                  color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                        // ini harus diubah jadi return listview builder
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Question from ${snapshot.data[index].username}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("${snapshot.data[index].question}",
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                    ),
                                ),
                              ]),
                            ),
                          ),
                        );
                      }
                    }
                  },
                )
              ],
            ),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
