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
    final width = MediaQuery.of(context).size.width;
    return Material(
      child: Column(
        children: [
          SizedBox(height: 35),
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.white,
            radius: 48,
          ),
          SizedBox(height: 12),
          Text(
            "@social handle",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
              width: width > 680 ? 680 : width * 0.95,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20),
                onPressed: () {},
                child: Text(
                  "Instagram",
                  style: TextStyle(fontSize: 16),
                ),
                color: Colors.tealAccent,
              ))
        ],
      ),
    );
  }
}

final imageUrl =
    "https://avatars.githubusercontent.com/u/60123878?s=400&u=136408393f1899f8983e39d366abfff911452b38&v=4";
