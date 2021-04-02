import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FlatButton(
        child: Text('Add button'),
        color: Colors.greenAccent.shade400,
        padding: EdgeInsets.symmetric(vertical: 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add new button'),
                content: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Your media',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Link',
                          hintText: 'Your link',
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                    onPressed: () {},
                    child: Text('Add'),
                    textColor: Colors.blue,
                  ),
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel'),
                    textColor: Colors.blue,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
