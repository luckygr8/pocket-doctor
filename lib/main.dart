import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_doctor/models/user.dart';
import 'package:pocket_doctor/screens/mainScreen.dart';
import 'package:pocket_doctor/screens/signInScreen.dart';
import 'package:pocket_doctor/screens/signUpScreen.dart';
import 'package:pocket_doctor/config/const.dart';

//remove temp
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*var user = await Auth.getSigningInfo();
  print(user);*/
  Firebase.initializeApp();
  getData();
  //print(user.email);
  runApp(MainApp(AppUser(email: "gg@gg.com")));
}

class MainApp extends StatelessWidget {
  final AppUser user;

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

void getData() async {
  var query = FirebaseFirestore.instance.collection("users");
  await query.get().then((value) => print(value));
}
