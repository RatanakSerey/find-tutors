import 'package:find_tutors/ui/pages/auth/reset_password.dart';
import 'package:find_tutors/ui/pages/auth/signin.dart';
import 'package:find_tutors/ui/pages/auth/signup.dart';
import 'package:find_tutors/ui/pages/tutors/profile.dart';
import 'package:find_tutors/ui/pages/students/subjects.dart';
import 'package:find_tutors/ui/pages/students/tutors_list.dart';
import 'package:find_tutors/ui/pages/students/tutors_detail.dart';
import 'package:find_tutors/ui/pages/students/subjects_detail.dart';
import 'package:flutter/material.dart';

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
      case "SignIn":
        return SignInWidget(changeScreen: changeScreen);
        break;
      case "Profile":
        return ProfileTwoPage(changeScreen: changeScreen);
        break;
      case "SubjectList":
        return SubjectList(changeScreen: changeScreen);
        break;
      case "SubjectDetail":
        return SubjectsDetail(changeScreen: changeScreen);
        break;
      case "TutorsList":
        return TutorList(changeScreen: changeScreen);
        break;
      // case "TutorsDetail":
      //   return TutorsDetail(changeScreen: changeScreen);
      //   break;
      default:
        return null;
        break;
    }
  }
}
