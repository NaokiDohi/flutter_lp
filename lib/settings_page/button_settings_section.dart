import 'package:flutter/material.dart';
import 'package:flutter_lp/constant.dart';

class ButtonSettingsSection extends StatelessWidget {
  const ButtonSettingsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
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
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Add button'),
                    color: Colors.greenAccent.shade400,
                    padding: EdgeInsets.symmetric(vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  height: constraints.maxHeight * 0.5,
                  child: ReorderableListView(
                    children: [
                      for (var document in documents)
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          title: Text(document.title),
                          key: Key(document.title),
                          leading: Icon(Icons.drag_indicator),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                    ],
                    onReorder: (oldIndex, newIndex) {},
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