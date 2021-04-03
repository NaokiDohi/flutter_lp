import 'package:flutter/material.dart';
import 'package:flutter_lp/landing_page/landing_page.dart';
import 'package:flutter_lp/login_page/login_page.dart';
import 'package:flutter_lp/models/link_data.dart';
import 'package:flutter_lp/settings_page/settings_page.dart';
import 'package:flutter_lp/not_found_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // FirebaseFirestore.instance.settings = Settings(
  //   host: 'localhost:8080',
  //   sslEnabled: false,
  //   persistenceEnabled: false,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final linksCollection = FirebaseFirestore.instance.collection('links');
    final userLinkDataStream =
        linksCollection.orderBy('position').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LinkData.fromDocument(doc);
      }).toList();
    });
    return MultiProvider(
      providers: [
        StreamProvider<User>(
          create: (context) => FirebaseAuth.instance.authStateChanges(),
        ),
        Provider<CollectionReference>(
          create: (context) => linksCollection,
        ),
        StreamProvider<List<LinkData>>(
          create: (context) => userLinkDataStream,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              // settings.nameで/settingsなどのルートがみれる
              return RouteController(settingsName: settings.name);
            },
          );
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return NotFoundPage();
            },
          );
        },
      ),
    );
  }
}

class RouteController extends StatelessWidget {
  final String settingsName;
  const RouteController({
    Key key,
    @required this.settingsName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // サーバに存在するユーザーであればtrueを返す
    final userSignedIn = Provider.of<User>(context) != null;
    // ユーザーが存在せずルートが/settingsの時ログインページにリダイレクトする。
    final notSignedInGoSettings = !userSignedIn && settingsName == '/settings';
    // ユーザーが存在しルートが/settingsの時セッティングページにリダイレクトする。
    final signedInGoSettings = userSignedIn && settingsName == '/settings';
    if (settingsName == '/') {
      return LandingPage();
    } else if (notSignedInGoSettings || settingsName == '/login') {
      return LoginPage();
    } else if (signedInGoSettings) {
      return SettingsPage();
    } else {
      return NotFoundPage();
    }
  }
}
