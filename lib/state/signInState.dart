import 'package:flutter/cupertino.dart';
import 'package:pocket_doctor/components/flare.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/config/const.dart';

class SignInState with ChangeNotifier {
  String email = '';
  String password = '';
  Widget placeholder = SizedBox();

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String pass) {
    this.password = pass;
    notifyListeners();
  }

  void setPlaceholder(Widget place) {
    this.placeholder = place;
    notifyListeners();
  }

  bool validate() {
    if (this.email.isEmpty)
      placeholder = CText(
        value: 'please fill the email field',
        factor: 1.5,
        textColor: lightColor,
      );
    else if (this.password.isEmpty)
      placeholder = CText(
        value: 'please fill the password field',
        factor: 1.5,
        textColor: lightColor,
      );
    else {
      placeholder = SizedBox(height: 50, width: 50, child: Heart());
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}
