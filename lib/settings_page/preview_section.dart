import 'package:flutter/material.dart';

class PreviewSection extends StatelessWidget {
  const PreviewSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          color: Colors.white,
        ));
  }
}
