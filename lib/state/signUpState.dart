import 'package:flutter/cupertino.dart';
import 'package:pocket_doctor/components/flare.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/config/const.dart';

class SignUpState with ChangeNotifier {
  String email = '';
  String password = '';
  String confPassword = '';

  Widget placeholder = SizedBox();

  void setEmail(String str) {
    this.email = str;
    print(this.email);
    notifyListeners();
  }

  void setPassword(String str) {
    this.password = str;
    print(this.password);
    notifyListeners();
  }

  void setConfPassword(String str) {
    this.confPassword = str;
    print(this.confPassword);
    notifyListeners();
  }

  void setPlaceholder(Widget place) {
    this.placeholder = place;
    notifyListeners();
  }

  bool validate() {
    if (this.email.isEmpty)
      this.placeholder = CText(
        value: 'please fill the email field',
        factor: 1.5,
        textColor: lightColor,
      );
    else if (this.password.isEmpty)
      this.placeholder = CText(
        value: 'please fill the password field',
        factor: 1.5,
        textColor: lightColor,
      );
    else if (this.confPassword.isEmpty)
      this.placeholder = CText(
        value: 'please refill your password',
        factor: 1.5,
        textColor: lightColor,
      );
    else if (this.password != this.confPassword)
      this.placeholder = CText(
        value: 'Both passwords should match',
        factor: 1.5,
        textColor: lightColor,
      );
    else {
      this.placeholder = SizedBox(height: 50, width: 50, child: Heart());
      notifyListeners();
      return true;
    }

    notifyListeners();
    return false;
  }
}
