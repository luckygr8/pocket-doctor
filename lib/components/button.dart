import 'package:flutter/material.dart';
import 'package:pocket_doctor/components/text.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/firebase/auth.dart';
import 'package:pocket_doctor/models/user.dart';

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
            ),
          ),
        ),
      ),
    );
  }
}

class CMoreButton extends StatelessWidget {
  final double side = 50;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //await Auth.signOut();
        Navigator.of(context).popAndPushNamed('/signIn');
      },
      child: Container(
        height: side.toDouble(),
        width: side.toDouble(),
        decoration: BoxDecoration(
            color: lightColor,
            boxShadow: [
              BoxShadow(color: primaryColor, blurRadius: 1, spreadRadius: 4)
            ],
            borderRadius: BorderRadius.circular(side.toDouble())),
        child: Icon(
          Icons.exit_to_app,
          color: darkColor,
        ),
      ),
    );
  }
}

class CMemberSelectButton extends StatefulWidget {
  @override
  _CMemberSelectButtonState createState() => _CMemberSelectButtonState();
}

class _CMemberSelectButtonState extends State<CMemberSelectButton> {
  Member _selectedMember = Member.testList[0];

  //TESTING
  List<DropdownMenuItem<Member>> makeList() {
    List<DropdownMenuItem<Member>> list = [];

    for (Member member in Member.testList)
      list.add(DropdownMenuItem(
        child: Text(member.name),
        value: member,
      ));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: primaryColor, blurRadius: 1, spreadRadius: 4)
        ],
      ),
      child: DropdownButton<Member>(
        items: makeList(),
        onChanged: (value) {
          setState(() {
            _selectedMember = value;
            // TODO -> change the app state based on new member
          });
        },
        value: _selectedMember,
        icon: Icon(Icons.arrow_downward),
        underline: SizedBox(),
      ),
    );
  }
}
