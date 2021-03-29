import 'package:flutter/material.dart';
import 'package:flutter_lp/settings_page/button_settings_section.dart';
import 'package:flutter_lp/settings_page/preview_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
