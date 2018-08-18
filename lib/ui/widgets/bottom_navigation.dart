import 'dart:async';
import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
// Page
import 'package:find_tutors/ui/pages/auth/signin.dart';
import 'package:find_tutors/ui/pages/map/map.dart';
import 'package:find_tutors/ui/pages/students/subjects.dart';
// Widget
import 'package:find_tutors/ui/widgets/drawer.dart';

class TabItem {
  final Widget title;
  final Icon icon;
  TabItem({this.title, this.icon});
}

final List tabItems = [
  TabItem(title: Text('Home'), icon: Icon(Icons.home)),
  TabItem(title: Text('Map'), icon: Icon(Icons.map)),
  TabItem(title: Text('Profile'), icon: Icon(Icons.person_outline)),
];

class TabNavigator extends StatefulWidget {
  @override
  State createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  int _tab = 0;
  String appBarTitle = "";
  List<String> subjectListScreens = [Constants.subjectList];
  List<String> signinScreens = [Constants.signin];
  final List<String> initialScreens = [Constants.subjectList];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: Stack(children: <Widget>[
        Offstage(
          offstage: _tab != 0,
          child: SubjectListPage(
              screens: subjectListScreens, changeScreen: changeScreen),
        ),
        Offstage(
          offstage: _tab != 1,
          child: MapPage(),
        ),
        Offstage(
          offstage: _tab != 2,
          child: Signin(screens: signinScreens, changeScreen: changeScreen),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: onTap,
        items: tabItems.map((item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            title: item.title,
          );
        }).toList(),
      ),
    );
  }

  void onTap(int index) {
    if (index == _tab) {
      setState(() {
        this.subjectListScreens = [initialScreens[index]];
      });
    }
    setState(() {
      _tab = index;
    });
  }

  void changeScreen({String screen, bool pop = false}) {
    if (!pop) {
      this.subjectListScreens.add(screen);
    } else {
      this.subjectListScreens.removeLast();
    }
    setState(() {
      this.subjectListScreens;
    });
  }

  Widget buildDrawer() {
    return CustomDrawer();
  }

  Widget buildAppBar() {
    // if (_page != 0) {
    return null;
    // }
    // return AppBar(
    // title: Text(appBarTitle),
    // );
  }
}
