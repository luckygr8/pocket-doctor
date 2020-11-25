import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocket_doctor/components/bottom_nav.dart';
import 'package:pocket_doctor/components/documents_res.dart';
import 'package:pocket_doctor/components/header.dart';
import 'package:pocket_doctor/components/medicines_res.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/state/manage_index.dart';
import 'package:provider/provider.dart';
import 'package:pocket_doctor/pages/appointments_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setSize(MediaQuery.of(context).size);
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => SManageIndex(),
        child: Scaffold(
          backgroundColor: lightColor,
          appBar: Header(),
          body: AppView(),
          bottomNavigationBar: CBottomNavBar(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;
  var c;
  void getMessage() async {
    print("\n\n---------------------------------------------------\n\n");
    //for fetching data from id
    await firestore
        .collection("users")
        .doc("goga@email.com")
        .get()
        .then((value) {
      c = value.data();
    });
    print(c);
/*
    c['alice']['appointments'].add({
      'date': Timestamp(1606329000, 0),
      'doctorName': 'Dr. Potts',
      'description': 'colddrink',
      'isActive': false
    });

    //for update in firestore
    await firestore
        .collection("users")
        .doc("goga@email.com")
        .update(c)
        .then((_) {
      print("--update successful--");
    });

    //for adding new data in firestore
    await firestore.collection("users").doc("dutta@email.com").set({
      'bob': {
        'appointments': [
          {
            'date': Timestamp(1606329000, 0),
            'doctorName': 'Dr. Narayana',
            'description': 'headache',
            'isActive': false
          }
        ],
        'medicines': [
          {
            'doctorName': 'Dr. Mohit',
            'times': {'1:30 PM': false, '9:30 AM': true},
            'quantity': '1 tablet',
            'description': 'for acidity',
            'medicineName': 'Zinetac'
          }
        ],
        'documents': [
          {
            'date': Timestamp(1606069800, 0),
            'description': 'x-ray report',
            'location': ""
          }
        ]
      }
    }).then((_) {
      print("--successfully added new user!--");
    });

 */
  }

  @override
  Widget build(BuildContext context) {
    getMessage();
    return Consumer<SManageIndex>(
      builder: (context, manageIndex, child) => PageView(
        controller: manageIndex.controller,
        physics: BouncingScrollPhysics(),
        onPageChanged: (value) => manageIndex.changePage(value),
        children: [
          Container(
            child: AppointmentsPage(),
          ),
          Container(
            child: Center(
              // for testing
              child: NoMedicinesFound(),
            ),
          ),
          Container(
            child: Center(
              // for testing
              child: NoDocumentsFound(),
            ),
          ),
        ],
      ),
    );
  }
}
