import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:pocket_doctor/config/const.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setSize(MediaQuery.of(context).size);

    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/intro_back.png'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 40,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: Container(
                        child: Center(
                          child: Heart(),
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
            ),
            Expanded(
              flex: 15,
              child: Container(
                child: CText(
                  value: 'Pocket Doctor',
                  textColor: darkColor,
                  fontWeight: FontWeight.bold,
                  factor: 3.3,
                ),
              ),
            ),
            Expanded(
              flex: 45,
              child: Container(),
            ),
          ],
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
