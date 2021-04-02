import 'package:flutter/material.dart';
import 'package:flutter_lp/models/link_data.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key key,
    @required this.document,
  }) : super(key: key);

  final LinkData document;

  @override
  Widget build(BuildContext context) {
    final _linksCollection = Provider.of<CollectionReference>(context);
    TextEditingController _titleTextController = TextEditingController(
      text: document.title,
    );
    TextEditingController _urlTextController = TextEditingController(
      text: document.url,
    );
    final _formKey = GlobalKey<FormState>();
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Edit ${document.title} button'),
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
                    // 変更があればtrueを返すなければfalseを返す
                    final userChangedTitle =
                        document.title != _titleTextController.text;
                    final userChangedUrl =
                        document.url != _urlTextController.text;
                    // ||はORの意味 どちらかが変更されればtrueを返し変更がなければfalseを返す
                    final userUpdateForm = userChangedTitle || userChangedUrl;
                    if (_formKey.currentState.validate()) {
                      // Validates every [FormField] that is a descendant of this [Form],
                      // and returns true if there are no errors.
                      if (userUpdateForm) {
                        final newlinkData = LinkData(
                          title: _titleTextController.text,
                          url: _urlTextController.text,
                        );
                        _linksCollection.doc(document.id).update(
                              newlinkData.toMap(),
                            );
                      }
                      print('updates is $userUpdateForm');
                      Navigator.of(context).pop();
                      _formKey.currentState.reset();
                    }
                  },
                  child: Text('Edit'),
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
    );
  }
}
