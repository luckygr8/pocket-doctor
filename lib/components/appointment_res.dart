import 'package:flutter/material.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/config/const.dart';

class NoAppointmentFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/no appointments.png',
            height: size.height * .3,
            width: size.height * .3,
          ),
          CText(
            value: 'Yaay ! No appointments for today',
            factor: 1.5,
            textColor: primaryColorDark,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
