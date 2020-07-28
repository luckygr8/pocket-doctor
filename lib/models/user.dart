import 'package:pocket_doctor/models/appointment.dart';
import 'package:pocket_doctor/models/document.dart';
import 'package:pocket_doctor/models/medicine.dart';
import 'package:flutter/material.dart';

class Member {
  String name;
  List<Medicine> medicines;
  List<Appointment> appointments;
  List<Document> documents;

  Member(
      {@required this.name, this.appointments, this.documents, this.medicines});
}

class User {
  String email;
  List<Member> members;

  User({@required this.email, this.members});
}
