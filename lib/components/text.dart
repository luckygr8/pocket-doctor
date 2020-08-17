import 'package:flutter/material.dart';
import 'package:pocket_doctor/config/const.dart';

class CText extends StatelessWidget {
  final textColor;
  final fontWeight;
  final value;
  final factor;
  final textAlign;

  CText(
      {this.textColor = darkColor,
      this.fontWeight = FontWeight.normal,
      this.factor = 4,
      this.value = '',this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: (size.width + size.height) / 100 * factor,
          fontWeight: fontWeight,
          color: textColor),
    );
  }
}
