import 'dart:async';
import 'package:flutter/material.dart';

// Page
import 'package:find_tutors/ui/pages/auth/signin.dart';
import 'package:find_tutors/ui/pages/map/map.dart';
import 'package:find_tutors/ui/pages/students/subjects.dart';

// Widget
import 'package:find_tutors/ui/widgets/drawer.dart';

class TabNavigator extends StatefulWidget {
  @override
  State createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  int _page = 0;
  String appBarTitle = "";
  Future<bool> _onBackPressed() async {
    if (_page != 0) {
      return true;
    }
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Are you sure?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                    child: Text('Yes'),
                    onPressed: () => Navigator.pop(context, true)),
              ],
            ));
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: buildAppBar(),
        drawer: buildDrawer(),
        body: Stack(children: <Widget>[
          Offstage(
            offstage: _page != 0,
            child: SubjectListScreen(),
          ),
          Offstage(
            offstage: _page != 1,
            child: MapPage(),
          ),
          Offstage(
            offstage: _page != 2,
            child: Signin(),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: onTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _page = index;
      appBarTitle = index.toString();
    });
  }

  Widget buildDrawer() {
    // return null;
    return CustomDrawer();
  }

  Widget buildAppBar() {
    if (_page != 0) {
      return null;
    }
    return AppBar(
      title: Text(appBarTitle),
    );
  }
}
