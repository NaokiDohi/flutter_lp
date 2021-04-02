import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lp/landing_page/landing_page.dart';
import 'package:flutter_lp/login_page/login_page.dart';
import 'package:flutter_lp/models/link_data.dart';
import 'package:flutter_lp/settings_page/settings_page.dart';
import 'package:flutter_lp/not_found_page.dart';
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
    final userLinkDataStream = linksCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LinkData.fromDocument(doc);
      }).toList();
    });
    return MultiProvider(
      providers: [
        Provider<CollectionReference>(
          create: (context) => linksCollection,
        ),
        StreamProvider<List<LinkData>>(
          create: (context) => userLinkDataStream,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LandingPage(),
          '/settings': (context) => SettingsPage(),
          '/login': (context) => LoginPage(),
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
