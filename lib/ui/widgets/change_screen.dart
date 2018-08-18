import 'package:flutter/material.dart';
import 'package:find_tutors/ui/pages/auth/signin.dart';
import 'package:find_tutors/ui/pages/tutors/profile.dart';
import 'package:find_tutors/ui/pages/students/subjects.dart';
import 'package:find_tutors/ui/pages/students/tutors_list.dart';
import 'package:find_tutors/ui/pages/students/subjects_detail.dart';
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
      case Constants.signin:
        return SignInWidget(changeScreen: changeScreen);
        break;
      case Constants.profile:
        return ProfileTwoPage(changeScreen: changeScreen);
        break;
      case Constants.subjectList:
        return SubjectList(changeScreen: changeScreen);
        break;
      case Constants.subjectDetail:
        return SubjectsDetail(changeScreen: changeScreen);
        break;
      case Constants.tutorsList:
        return TutorList(changeScreen: changeScreen);
        break;
      default:
        return Text("null");
        break;
    }
  }
}
