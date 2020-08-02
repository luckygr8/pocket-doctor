import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_doctor/components/button.dart';
import 'package:pocket_doctor/components/flare.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/components/textbox.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/screens/signUpScreen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setSize(MediaQuery.of(context).size);

    return Material(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/intro_back.png'), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  //color: Colors.red,
                  height: size.height * .4,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 60,
                        child: Container(
                          child: Center(
                            child: Hero(
                              child: Heart(),
                              tag: 'heart',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 40,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * .05,
                  child: CText(
                    value: 'Pocket Doctor',
                    textColor: darkColor,
                    fontWeight: FontWeight.bold,
                    factor: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: size.height * .7,
                  child: Column(
                    children: [
                      CTextBox(
                        label: 'your email Id',
                        textColor: darkColor,
                        isEnabled: true,
                        obscure: false,
                        borderColor: primaryColorDark,
                        callback: (value) {
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CTextBox(
                        label: 'your password',
                        textColor: darkColor,
                        isEnabled: true,
                        obscure: true,
                        borderColor: primaryColorDark,
                        callback: (value) {
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CButton(
                        text: 'Continue',
                        onPressed: () {
                          print('pressedd');
                          Navigator.of(context).popAndPushNamed('/main');
                          // TODO @goga please find why hero animation not working
                          //Navigator.popAndPushNamed(context, '/main');
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen(),));
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).popAndPushNamed('/signUp');
                          /*Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));*/
                        },
                        child: CText(
                          value: 'Don\'t have an account with us ?',
                          textColor: darkColor,
                          factor: 1.5,
                        ),
                      ),
                    ],
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
