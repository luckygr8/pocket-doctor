import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_doctor/components/button.dart';
import 'package:pocket_doctor/components/flare.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/components/textbox.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/screens/signInScreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setSize(MediaQuery.of(context).size);

    return Material(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [lightColor, primaryColorDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                Container(
                  height: size.height * .2,
                  child: Hero(
                    child: Heart(),
                    tag: 'heart',
                  ),
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                Container(
                  height: size.height * .1,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CTextBox(
                    textColor: darkColor,
                    callback: (value) {
                      print(value);
                    },
                    borderColor: primaryColorDark,
                    obscure: false,
                    isEnabled: true,
                    label: 'Enter your email',
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .1,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CTextBox(
                    textColor: darkColor,
                    callback: (value) {
                      print(value);
                    },
                    borderColor: primaryColorDark,
                    obscure: true,
                    isEnabled: true,
                    label: 'Enter your password',
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .1,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CTextBox(
                    textColor: darkColor,
                    callback: (value) {
                      print(value);
                    },
                    borderColor: primaryColorDark,
                    obscure: true,
                    isEnabled: true,
                    label: 'confirm your password',
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .1,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: CButton(
                      text: 'Signup',
                      onPressed: () {
                        print('presed');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Container(
                  height: size.height * .1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).popAndPushNamed('/signIn');
                      /*Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ));*/
                    },
                    child: CText(
                      value: 'Go Back',
                      textColor: darkColor,
                      //fontWeight: FontWeight.bold,
                      factor: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
