import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final _linksCollection = Provider.of<CollectionReference>(context);
    TextEditingController _titleTextController = TextEditingController();
    TextEditingController _urlTextController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
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
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _titleTextController,
                        validator: (value) {
                          return value.isEmpty ? 'Please add in a title' : null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Your media',
                        ),
                      ),
                      TextFormField(
                        controller: _urlTextController,
                        validator: (value) {
                          return value.isEmpty ? 'Please add in a url' : null;
                        },
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
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // Validates every [FormField] that is a descendant of this [Form],
                        // and returns true if there are no errors.
                        _linksCollection.add({
                          'title': _titleTextController.text,
                          'url': _urlTextController.text,
                        });
                        Navigator.of(context).pop();
                        _formKey.currentState.reset();
                      }

                      print(_titleTextController.text);
                      print(_urlTextController.text);
                    },
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
