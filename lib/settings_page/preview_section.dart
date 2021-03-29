import 'package:flutter/material.dart';
import 'package:flutter_lp/landing_page/landing_page.dart';

class PreviewSection extends StatelessWidget {
  const PreviewSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child:
                Text("Preview", style: Theme.of(context).textTheme.headline3),
          ),
          SizedBox(height: 20),
          Expanded(child: LandingPage()),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
