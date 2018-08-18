// Show Subjects on home page
import 'dart:async';
import 'package:find_tutors/ui/widgets/page_reveal.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/ui/widgets/change_screen.dart';

class SubjectListPage extends StatefulWidget {
  final List<String> screens;
  final Function changeScreen;
  SubjectListPage({this.screens, this.changeScreen});

  @override
  _SubjectListPageState createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
  Future<bool> _onBackPressed() async {
    if (widget.screens.length == 1) {
      return true;
    }
    widget.changeScreen(pop: true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new SingleChildScrollView(
          child: Column(
        children: <Widget>[
          buildAppBar(),
          ChangeScreen(
              screen: widget.screens[widget.screens.length - 1],
              changeScreen: widget.changeScreen),
        ],
      )),
    );
  }

  Widget buildAppBar() {
    Widget leading;
    if (widget.screens.length > 1) {
      leading = IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => widget.changeScreen(pop: true),
      );
    }
    return AppBar(
        title: Text(widget.screens[widget.screens.length - 1]),
        leading: leading);
  }
}

class SubjectList extends StatefulWidget {
  final Function changeScreen;
  const SubjectList({
    this.changeScreen,
    Key key,
  }) : super(key: key);
  @override
  SubjectListState createState() {
    return new SubjectListState();
  }
}

class SubjectListState extends State<SubjectList>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn)
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(animation.value);
    return PageReveal(
      revealPercent: animation.value,
      child: Container(
          color: Colors.red,
          height: 500.0,
          child: Center(
            child: RaisedButton(
              onPressed: () => widget.changeScreen(screen: Constants.tutorsList),
              child: new Text("Go To Tutors List"),
            ),
          )),
    );
  }
}
