import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          for (var document in documents)
            ButtonLink(
              title: document['title'],
              url: document['url'],
            ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made in Flutter',
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(width: 8),
              Image.asset(
                "assets/Icon-192.png",
                width: 25,
              )
            ],
          ),
          SizedBox(height: 23),
        ],
      ),
    );
  }
}

final documents = [
  {'title': 'Instagram', 'url': 'https://www.instagram.com/jonathan_naoki_/'},
  {'title': 'Twitter', 'url': 'https://twitter.com/Naoki_Dohi_0209'},
];

class ButtonLink extends StatelessWidget {
  const ButtonLink({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
          width: width > 680 ? 680 : width * 0.95,
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20),
            onPressed: () => launch(url),
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            color: Colors.tealAccent,
          )),
    );
  }
}

final imageUrl =
    "https://avatars.githubusercontent.com/u/60123878?s=400&u=136408393f1899f8983e39d366abfff911452b38&v=4";
