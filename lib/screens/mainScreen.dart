import 'package:flutter/material.dart';
import 'package:pocket_doctor/components/bottom_nav.dart';
import 'package:pocket_doctor/components/documents_res.dart';
import 'package:pocket_doctor/components/header.dart';
import 'package:pocket_doctor/components/medicines_res.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/state/manage_index.dart';
import 'package:provider/provider.dart';
import 'package:pocket_doctor/pages/appointments_page.dart';

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
  @override
  Widget build(BuildContext context) {
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
