import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Displayed on screen in a 3:2 ratio
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.blueGrey.shade50,
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
