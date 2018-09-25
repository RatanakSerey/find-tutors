//packages
import 'package:find_tutors/screens/auth/signin.dart';
import 'package:find_tutors/screens/home/post_detail.dart';
import 'package:find_tutors/screens/home/post_list.dart';
import 'package:find_tutors/screens/home/subjects.dart';
import 'package:find_tutors/screens/tutors/profile.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
        return SigninPage(changeScreen: changeScreen);
        break;
      case ScreenHelper.profile:
        return ProfileTwoPage(changeScreen: changeScreen);
        break;
      case ScreenHelper.subjectList:
        return SubjectListPage(changeScreen: changeScreen);
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
