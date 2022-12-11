// @dart=2.9
import 'package:ecoist/landing/components/drawer_admin.dart';
import 'package:ecoist/landing/components/drawer_user.dart';
import 'package:ecoist/landing/components/drawer_unlogin.dart';
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
          "/admin_ecoist": (BuildContext context) =>
          const AdminEcoistPage(),
          '/home': (BuildContext context) => const MyHomePage(title: "-"),
        },
        initialRoute: "/home",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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

      body: Center(
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
              'Welcome to Ecoist, where we can create a better world together.',
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}