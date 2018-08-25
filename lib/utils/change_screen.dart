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
        return SignInWidget(changeScreen: changeScreen);
        break;
      case ScreenHelper.profile:
        return ProfileTwoPage(changeScreen: changeScreen);
        break;
      case ScreenHelper.subjectList:
        return SubjectListPageWidget(changeScreen: changeScreen);
        break;
      case ScreenHelper.postDetail:
        return PostDetailPage(changeScreen: changeScreen);
        break;
      case ScreenHelper.postList:
        return PostListPage(changeScreen: changeScreen);
        break;
      default:
        return Text("null");
        break;
    }
  }
}
