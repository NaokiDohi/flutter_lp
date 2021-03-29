import 'package:flutter/material.dart';
import 'package:flutter_lp/landing_page/landing_page.dart';
import 'package:flutter_lp/settings_page/settings_page.dart';
import 'package:flutter_lp/not_found_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/settings': (context) => SettingsPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return NotFoundPage();
          },
        );
      },
    );
  }
}
