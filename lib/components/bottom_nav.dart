import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/state/manage_index.dart';
import 'package:provider/provider.dart';

class CBottomNavBar extends StatefulWidget {
  @override
  _CBottomNavBarState createState() => _CBottomNavBarState();
}

class _CBottomNavBarState extends State<CBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SManageIndex>(
      builder: (context, manageIndex, child) => Container(
        height: 80,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: primaryColorDark,
            boxShadow: [
              BoxShadow(
                color: primaryColorDark,
                blurRadius: 4,
                spreadRadius: 6,
                offset: Offset(5, 5),
              ),
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: BottomNavigationBar(
          elevation: 10,
          selectedItemColor: lightColor,
          backgroundColor: primaryColorDark,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.hospital,
                ),
                title: CText(value: 'Appointments',factor: 1,textColor: lightColor,)),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.pills,
              ),
              title: CText(value: 'Medicines',factor: 1,textColor: lightColor,),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bookMedical,
              ),
              title: CText(value: 'Documents',factor: 1,textColor: lightColor,),
            ),
          ],
          currentIndex: manageIndex.index,
          onTap: (value) => manageIndex.changePage(value),
        ),
      ),
    );
  }
}
