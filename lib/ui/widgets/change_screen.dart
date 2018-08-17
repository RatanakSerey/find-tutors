import 'package:find_tutors/ui/pages/auth/reset_password.dart';
import 'package:find_tutors/ui/pages/auth/signin.dart';
import 'package:find_tutors/ui/pages/auth/signup.dart';
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
      // case "SignUp":
      //   return Signup(changeScreen: changeScreen);
      //   break;
      case "ResetPassword":
        return ResetPassword(changeScreen: changeScreen);
        break;
      default:
        return null;
        break;
    }
  }
}
