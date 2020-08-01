import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_doctor/config/const.dart';

class IntroScreen extends StatelessWidget {
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
                            child: Hero(child: Heart(),tag: 'heart',),
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
                          // TODO @goga please find why hero animation not working
                          //Navigator.popAndPushNamed(context, '/main');
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen(),));
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CText(value: 'Don\'t have an account with us ?',textColor: darkColor,factor: 1.5,),
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

class Heart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'raw/animate.flr',
      animation: 'animation2',
    );
  }
}

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

class CButton extends StatelessWidget {
  final text;
  final onPressed;
  final onLongPressed;

  CButton({this.text, this.onPressed, this.onLongPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: lightColor,
            border: Border.all(color: primaryColorDark, width: 3),
          ),
          child: Center(
              child: CText(
            value: text,
            textColor: darkColor,
            factor: 2,
          ),),
        ),
      ),
    );
  }
}
