import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_doctor/screens/mainScreen.dart';
import 'package:pocket_doctor/screens/signInScreen.dart';
import 'package:pocket_doctor/screens/signUpScreen.dart';
import 'package:pocket_doctor/config/const.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [HeroController()],
      routes: {
        '/main': (_) => MainScreen(),
        '/signIn': (_) => SignInScreen(),
        '/signUp': (_) => SignUpScreen()
      },
      initialRoute: '/signIn',
      theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColorDark,
          accentColor: darkColor,
          cursorColor: darkColor,
          hintColor: primaryColorDark,
          fontFamily: 'Comfortaa'),
    );
  }
}
