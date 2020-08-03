import 'package:flutter/material.dart';

class Appointment {
  String doctorName;
  bool isActive;
  DateTime date;
  String description;

  Appointment(
      {@required this.doctorName,
      @required this.description,
      this.date,
      this.isActive});
}
