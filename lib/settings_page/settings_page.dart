import 'package:flutter/material.dart';
import 'package:flutter_lp/settings_page/button_settings_section.dart';
import 'package:flutter_lp/settings_page/preview_section.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          FlatButton.icon(
            label: Text('Sign out'),
            icon: Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: Row(
        children: [
          // Displayed on screen in a 3:2 ratio
          ButtonSettingsSection(),
          PreviewSection(),
        ],
      ),
    );
  }
}
