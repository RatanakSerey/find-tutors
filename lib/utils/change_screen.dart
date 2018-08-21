//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';
//screen
import 'package:find_tutors/screens/index.dart';

class ChangeScreen extends StatelessWidget {
  final String screen;
  final Function changeScreen;
  ChangeScreen({this.screen, this.changeScreen});

  @override
  Widget build(BuildContext context) {
    return buildScreen(screen);
  }

  Widget buildScreen(String screen) {
    switch (screen) {
      case ScreenHelper.signin:
        return SignInPage(changeScreen: changeScreen);
        break;
      case ScreenHelper.profile:
        return ProfileTwo(changeScreen: changeScreen);
        break;
      case ScreenHelper.subjectList:
        return SubjectListWidget(changeScreen: changeScreen);
        break;
      case ScreenHelper.postDetail:
        return PostDetail(changeScreen: changeScreen);
        break;
      case ScreenHelper.postList:
        return PostList(changeScreen: changeScreen);
        break;
      default:
        return Text("null");
        break;
    }
  }
}
