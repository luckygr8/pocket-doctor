import 'package:flutter/material.dart';
import 'package:pocket_doctor/config/const.dart';

class CText extends StatelessWidget {
  final textColor;
  final fontWeight;
  final value;
  final factor;

  CText(
      {this.textColor = darkColor,
      this.fontWeight = FontWeight.normal,
      this.factor = 4,
      this.value = ''});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
          fontSize: (size.width + size.height) / 100 * factor,
          fontWeight: fontWeight,
          color: textColor),
    );
  }
}
