import 'package:flutter/material.dart';
import 'package:find_tutors/ui/pages/auth/signin.dart';
import 'package:find_tutors/ui/pages/tutors/profile.dart';
import 'package:find_tutors/ui/pages/home/subjects.dart';
import 'package:find_tutors/ui/pages/home/post_list.dart';
import 'package:find_tutors/ui/pages/home/post_detail.dart';
import 'package:find_tutors/utils/constants.dart';

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
        return ProfileTwoPage(changeScreen: changeScreen);
        break;
      case ScreenHelper.subjectList:
        return SubjectList(changeScreen: changeScreen);
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
