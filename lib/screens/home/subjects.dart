//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';

class SubjectList extends StatefulWidget {
  final List<String> screens;
  final Function changeScreen;
  SubjectList({this.screens, this.changeScreen});

  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
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
      // buildAppBar(),
      child: ChangeScreen(
          screen: widget.screens[widget.screens.length - 1],
          changeScreen: widget.changeScreen),
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
      title: Text(
        widget.screens[widget.screens.length - 1],
        style: TextStyle(color: Color(0xFF6c5ce7)),
      ),
      leading: leading,
      backgroundColor: Colors.white,
    );
  }
}

class SubjectListWidget extends StatefulWidget {
  final Function changeScreen;
  const SubjectListWidget({
    this.changeScreen,
    Key key,
  }) : super(key: key);
  @override
  SubjectListWidgetState createState() {
    return new SubjectListWidgetState();
  }
}

class SubjectListWidgetState extends State<SubjectListWidget>
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
          child: Column(
            children: <Widget>[
              AppBar(title: Text("Chi")),
              Center(
                child: RaisedButton(
                  onPressed: () =>
                      widget.changeScreen(screen: ScreenHelper.postList),
                  child: new Text("Go To Post List"),
                ),
              ),
            ],
          )),
    );
  }
}
