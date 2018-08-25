//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';

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

class SubjectListPageWidget extends StatefulWidget {
  final Function changeScreen;
  const SubjectListPageWidget({
    this.changeScreen,
    Key key,
  }) : super(key: key);
  @override
  SubjectListPageWidgetState createState() {
    return new SubjectListPageWidgetState();
  }
}

class SubjectListPageWidgetState extends State<SubjectListPageWidget>
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
              CommonAppBar(
                title: 'Subject',
                onPress: () => Scaffold.of(context).openDrawer(),
              ),
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
