import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_doctor/screens/intro.dart';
import 'package:pocket_doctor/screens/signUp.dart';
import 'package:provider/provider.dart';
import 'package:pocket_doctor/config/const.dart';
import 'package:pocket_doctor/models/user.dart';
import 'package:pocket_doctor/state/manage_index.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/main':(_)=>MainScreen(),
        '/intro':(_)=>IntroScreen(),
        '/signUp':(_)=>SignUpPage()
      },
      initialRoute: '/signUp',
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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => SManageIndex(),
        child: Scaffold(
          backgroundColor: lightColor,
          appBar: Header(),
          body: AppView(),
          bottomNavigationBar: CBottomNavBar(),
        ),
      ),
    );
  }
}


class CBottomNavBar extends StatefulWidget {
  @override
  _CBottomNavBarState createState() => _CBottomNavBarState();
}

class _CBottomNavBarState extends State<CBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SManageIndex>(
      builder: (context, manageIndex, child) => Container(
        height: 80,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: primaryColorDark,
            boxShadow: [
              BoxShadow(color: primaryColorDark, blurRadius: 4, spreadRadius: 2)
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: BottomNavigationBar(
          backgroundColor: primaryColorDark,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), title: Text('one')),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarms), title: Text('two')),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_new), title: Text('three')),
          ],
          currentIndex: manageIndex.index,
          onTap: (value) => manageIndex.changePage(value),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SManageIndex>(
      builder: (context, manageIndex, child) => PageView(
        controller: manageIndex.controller,
        physics: BouncingScrollPhysics(),
        onPageChanged: (value) => manageIndex.changePage(value),
        children: [
          Container(
            child: Center(
              child: Text('first page'),
            ),
          ),
          Container(
            child: Center(
              child: Text('second page'),
            ),
          ),
          Container(
            child: Center(
              child: Text('third page'),
            ),
          ),
        ],
      ),
    );
  }
}

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
                  child: Center(child: Hero(tag:'heart',child: Heart())),
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

class CMoreButton extends StatelessWidget {
  final double side = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

// added a testing comment here

//Container(
//child: Image.asset('assets/backdrop.png',fit: BoxFit.fill,),
//clipBehavior: Clip.hardEdge,
//decoration: BoxDecoration(
////borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
//boxShadow: [BoxShadow(color: primaryColorDark,blurRadius: 1,spreadRadius: 2)],
//color: lightColor
//),
//);
