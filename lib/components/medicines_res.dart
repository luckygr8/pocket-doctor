import 'package:flutter/material.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/config/const.dart';

class NoMedicinesFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no medicines.png',height: size.height*.3,width: size.height*.3,),
          CText(value: 'No medicines for today !!',factor: 1.5,textColor: primaryColorDark,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}
