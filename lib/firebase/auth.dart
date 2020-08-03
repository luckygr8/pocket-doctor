import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/state/signInState.dart';
import 'package:pocket_doctor/state/signUpState.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FirebaseUser> getSigningInfo() async {
    return await _auth.currentUser();
  }

  // create a method to signUP
  static Future<FirebaseUser> signUp(
      String email, String password, SignUpState state) async {
    try {
      AuthResult res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (!(res == null)) {
        print('$res sucess');
        state.setPlaceholder(CText(
          value: 'Sign up success',
          factor: 1.5,
          textColor: lightColor,
        ));
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
      PlatformException pe = e as PlatformException;
      switch (pe.code) {
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          state.setPlaceholder(CText(
            value: 'This email is already registered',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'ERROR_WEAK_PASSWORD':
          state.setPlaceholder(CText(
            value: 'The password is too weak',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'ERROR_INVALID_EMAIL':
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

  static Future<FirebaseUser> signIn(
      String email, String password, SignInState state) async {
    try {
      AuthResult res = await _auth.signInWithEmailAndPassword(
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
      PlatformException pe = e as PlatformException;
      print(pe.code);
      switch (pe.code) {
        case 'ERROR_USER_NOT_FOUND':
          print('This email does\'nt exist');
          state.setPlaceholder(CText(
            value: 'This email does\'nt exist',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'ERROR_INVALID_EMAIL':
          print('This email does\'nt seem right');
          state.setPlaceholder(CText(
            value: 'This email does\'nt seem right',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'ERROR_WRONG_PASSWORD':
          print('Wrong password entered');
          state.setPlaceholder(CText(
            value: 'Wrong password entered',
            factor: 1.5,
            textColor: lightColor,
          ));
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
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
