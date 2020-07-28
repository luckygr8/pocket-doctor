import 'package:flutter/material.dart';

class Medicine {
  String name;
  List<DateTime> times;
  String description;
  bool isActive;
  String quantity;
  String doctorName;

  Medicine(
      {@required this.name,
      this.times,
      this.description,
      this.isActive,
      this.doctorName,
      @required this.quantity});
}
