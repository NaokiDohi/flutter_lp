import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lp/landing_page/button_link.dart';
import 'package:flutter_lp/constant.dart';
import 'package:flutter_lp/landing_page/footer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('links').snapshots(),
        builder: (context, snapshot) {
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
                    title: document.title,
                    url: document.url,
                  ),
                Spacer(),
                Footer(),
                SizedBox(height: 23),
              ],
            ),
          );
        });
  }
}
