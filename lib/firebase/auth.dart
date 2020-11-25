import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/state/signInState.dart';
import 'package:pocket_doctor/state/signUpState.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User getSigningInfo() {
    return _auth.currentUser;
  }

  // create a method to signUP
  static Future<User> signUp(
      String email, String password, SignUpState state) async {
    try {
      final res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (!(res == null)) {
        print('$res sucess');
        state.setPlaceholder(CText(
          value: 'Sign up success',
          factor: 1.5,
          textColor: lightColor,
        ));
        final firestore = FirebaseFirestore.instance;
        //ToDo: we have to make it global
        await firestore.collection("users").doc(email).set({}).then((_) {
          print("--successfully added new user!--");
        });
        return res.user;
      } else {
        state.setPlaceholder(CText(
          value: 'Could not sign you up.',
          factor: 1.5,
          textColor: lightColor,
        ));
        return null;
      }
    } catch (e) {
      FirebaseAuthException pe = e as FirebaseAuthException;
      print("code code code " + pe.code);
      switch (pe.code) {
        case 'email-already-in-use':
          state.setPlaceholder(CText(
            value: 'This email is already registered',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'weak-password':
          state.setPlaceholder(CText(
            value: 'The password is too weak',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'invalid-email':
          state.setPlaceholder(CText(
            value: 'This email is invalid',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        default:
          state.setPlaceholder(CText(
            value: 'Server side error',
            factor: 1.5,
            textColor: lightColor,
          ));
      }
      return null;
    }
  }

  static Future<User> signIn(
      String email, String password, SignInState state) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (!(res == null)) {
        {
          print('sign in success');
          return res.user;
        }
      } else {
        print('cant sign in');
        return null;
      }
    } catch (e) {
      FirebaseAuthException pe = e as FirebaseAuthException;
      print("code returned from firebase" + pe.code);
      switch (pe.code) {
        case 'user-not-found':
          print('This email does\'nt exist');
          state.setPlaceholder(CText(
            value: 'This email does\'nt exist',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'invalid-email':
          print('This email does\'nt seem right');
          state.setPlaceholder(CText(
            value: 'This email does\'nt seem right',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'wrong-password':
          print('Wrong password entered');
          state.setPlaceholder(CText(
            value: 'Wrong password entered',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'too-many-requests':
          print('Too many attempts');
          state.setPlaceholder(CText(
            value: 'Too many attempts',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        default:
          state.setPlaceholder(CText(
            value: 'server side error',
            factor: 1.5,
            textColor: lightColor,
          ));
          print('server side error');
      }
      return null;
    }
  }

  static Future<void> signOut() {
    return _auth.signOut();
  }
}
