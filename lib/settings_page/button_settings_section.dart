import 'package:flutter/material.dart';
import 'package:flutter_lp/models/link_data.dart';
import 'package:flutter_lp/settings_page/add_button.dart';
import 'package:flutter_lp/settings_page/edit_button.dart';
import 'package:flutter_lp/settings_page/delete_button.dart';
import 'package:provider/provider.dart';

class ButtonSettingsSection extends StatelessWidget {
  const ButtonSettingsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _documents = Provider.of<List<LinkData>>(context);
    return Expanded(
      flex: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth * 0.6;
          if (_documents == null) {
            // Page Loader
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            color: Colors.blueGrey.shade50,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Your Links',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 100),
                AddButton(width: width),
                SizedBox(height: 30),
                SizedBox(
                  width: width,
                  height: constraints.maxHeight * 0.5,
                  child: ReorderableListView(
                    children: [
                      for (var document in _documents)
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          title: Text(document.title),
                          key: Key(document.title),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              EditButton(document: document),
                              DeleteButton(document: document),
                            ],
                          ),
                        ),
                    ],
                    onReorder: (oldIndex, newIndex) {
                      // デフォルトで動いた後はnewIndexは+2される
                      if (oldIndex < newIndex) newIndex -= 1;
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
