import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_doctor/firebase/auth.dart';
import 'package:pocket_doctor/screens/mainScreen.dart';
import 'package:pocket_doctor/screens/signInScreen.dart';
import 'package:pocket_doctor/screens/signUpScreen.dart';
import 'package:pocket_doctor/config/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var user = await Auth.getSigningInfo();
  print(user);
  //print(user.email);
  runApp(MainApp(user));
}

class MainApp extends StatelessWidget {
  final FirebaseUser user;

  MainApp(this.user);

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
      initialRoute: user == null ? '/signIn' : '/main',
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
