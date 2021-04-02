import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LinkData {
  final String title;
  final String url;
  final String id;

  LinkData({
    @required this.title,
    @required this.url,
    this.id,
  });

  factory LinkData.fromDocument(QueryDocumentSnapshot data) {
    return LinkData(
      title: data.data()['title'],
      url: data.data()['url'],
      id: data.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
    };
  }
}
