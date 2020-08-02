import 'package:flutter/material.dart';
import 'package:pocket_doctor/config/const.dart';

class CTextBox extends StatefulWidget {
  final callback;
  final String label;
  final Color textColor;
  final Color borderColor;
  final bool obscure;
  final bool isEnabled;

  CTextBox(
      {this.callback,
      this.label,
      this.textColor,
      this.borderColor,
      this.obscure,
      this.isEnabled = true});

  @override
  _CTextBoxState createState() => _CTextBoxState();
}

class _CTextBoxState extends State<CTextBox> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: darkColor,
      onChanged: (value) => widget.callback(value),
      obscureText: widget.obscure,
      style: TextStyle(
        fontSize: size.width / 15,
        color: widget.textColor,
        fontWeight: FontWeight.bold,
      ),
      enabled: widget.isEnabled,
      decoration: InputDecoration(
        filled: false,
        fillColor: lightColor,
        focusColor: primaryColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: widget.borderColor, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: widget.borderColor, width: 2)),
        labelText: widget.label,
        labelStyle: TextStyle(
          letterSpacing: 3,
          fontSize: size.width / 23,
          color: widget.textColor,
        ),
      ),
    );
  }
}
