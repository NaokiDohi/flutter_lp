import 'package:flutter/material.dart';

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
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.white,
          radius: 48,
        )
      ],
    );
  }
}

final imageUrl =
    "https://avatars.githubusercontent.com/u/60123878?s=400&u=136408393f1899f8983e39d366abfff911452b38&v=4";
