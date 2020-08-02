import 'package:flutter/material.dart';
import 'package:pocket_doctor/components/button.dart';
import 'package:pocket_doctor/components/flare.dart';
import 'package:pocket_doctor/config/const.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColorDark,
        boxShadow: [
          BoxShadow(color: primaryColorDark, blurRadius: 4, spreadRadius: 2)
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(child: CMemberSelectButton()),
                ),
                Expanded(
                  flex: 1,
                  child: Center(child: CMoreButton()),
                ),
                Expanded(
                  flex: 1,
                  child: Center(child: Hero(tag: 'heart', child: Heart())),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 50,
                  child: Container(),
                ),
                Expanded(
                  flex: 50,
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(150);
}
