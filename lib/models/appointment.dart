import 'package:flutter/material.dart';

class Appointment {
  String doctorName;
  bool isActive;
  List<DateTime> dates;
  String description;

  Appointment(
      {@required this.doctorName,
      @required this.description,
      this.dates,
      this.isActive});
}
