import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_doctor/models/user.dart';
import 'package:pocket_doctor/screens/mainScreen.dart';
import 'package:pocket_doctor/screens/signInScreen.dart';
import 'package:pocket_doctor/screens/signUpScreen.dart';
import 'package:pocket_doctor/config/const.dart';
import 'firebase/auth.dart';
//remove temp
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = Auth.getSigningInfo();
  // print("--------------------------------------$user");
  // print("--------------------------------------${user.email}");
  // runApp(MainApp(AppUser(email: user.email)));
  runApp(MainApp(user));
}

class MainApp extends StatelessWidget {
  final user;

  MainApp(this.user);

  @override
  Widget build(BuildContext context) {
    //Firebase.initializeApp();
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

/**
 * 
 */
