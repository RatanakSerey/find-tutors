// Show Subjects on home page
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/ui/pages/students/tutors_list.dart';
import 'package:find_tutors/ui/widgets/drawer.dart';
import 'package:find_tutors/ui/widgets/change_screen.dart';

class SubjectListScreen extends StatefulWidget {
  @override
  _SubjectListScreenState createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  List<String> screens = ['SubjectList'];

  changeScreen({String screen, bool pop = false}) {
    if (!pop) {
      this.screens.add(screen);
    } else {
      this.screens.removeLast();
    }
    setState(() {
      this.screens;
    });
    print(this.screens);
  }

  Future<bool> _onBackPressed() async {
    if (this.screens.length == 1) {
      return true;
    }
    changeScreen(pop: true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new SingleChildScrollView(
          child: ChangeScreen(
              screen: screens[screens.length - 1], changeScreen: changeScreen)),
      // backgroundColor: Colors.white,
      // body: Center(
      //   child: new SingleChildScrollView(
      //   child: loginBody(),)
      // ),
    );
  }

  // List<Widget> signWidget() {
  //   return [loginHeader(), loginFields(context)];
  // }
  // loginBody() => Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[loginHeader(), loginFields()],
  //     );

}

class SubjectList extends StatelessWidget {
  final Function changeScreen;
  const SubjectList({
    this.changeScreen,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: RaisedButton(
        onPressed: () => changeScreen(screen: "TutorsList"),
        child: new Text("Go To Tutors List"),
      ),
    ));
  }
}
