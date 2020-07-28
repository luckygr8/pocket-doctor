import 'package:flutter/material.dart';

class Document {
  String description;
  DateTime dateOfAdding;
  String webUrl;

  Document({@required this.description, this.dateOfAdding, this.webUrl});
}
