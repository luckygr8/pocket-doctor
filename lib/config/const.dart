import 'package:flutter/material.dart';

const Color lightColor = Color(0xffd2fafb);
const Color primaryColor = Color(0xff51dacf);
const Color primaryColorDark = Color(0xff41aaa8);
const Color darkColor = Color(0xff2c003e);

Size size;

void setSize(Size s){
  if(size==null)
    size=s;
}