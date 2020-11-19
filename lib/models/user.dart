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

  static List<Member> testList = [
    Member(name: 'Papa', appointments: [], documents: [], medicines: []),
    Member(name: 'Mummy', appointments: [], documents: [], medicines: []),
    Member(name: 'Daadi', appointments: [], documents: [], medicines: []),
    Member(name: 'NiKKa', appointments: [], documents: [], medicines: []),
  ];
}

class AppUser {
  String email;
  List<Member> members;

  AppUser({@required this.email, this.members});
}
