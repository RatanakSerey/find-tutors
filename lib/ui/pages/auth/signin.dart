import 'dart:async';
import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:find_tutors/ui/widgets/change_screen.dart';
import 'package:find_tutors/ui/widgets/gradient_button.dart';
import 'signup.dart';
import 'reset_password.dart';

class Signin extends StatefulWidget {
  final List screens;
  final Function changeScreen;
  Signin({this.screens, this.changeScreen});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeScreen(
        screen: widget.screens[widget.screens.length - 1],
        changeScreen: widget.changeScreen,
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  final Function changeScreen;
  const SignInPage({
    this.changeScreen,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            loginHeader(), loginFields(context), loginFooter(context)
            // ChangeScreen(screen: this.screens[this.screens.length - 1])
          ]),
    );
  }

  loginHeader() => Container(
      margin: new EdgeInsets.only(top: 70.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlutterLogo(
            colors: Colors.green,
            size: 80.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome to ${Constants.appName}",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
        ],
      ));
  loginFields(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: TextField(
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              width: double.infinity,
              child: GradientButton(onPressed: (){}, text: Constants.signin,)
,
              // child: RaisedButton(
              //   padding: EdgeInsets.all(12.0),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(5.0))),
              //   child: Text(
              //     "SIGN IN",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   color: Color(0xFF4E54C8),
              //   onPressed: () {
              //     // Navigator.pop(context);
              //     // Navigator.pushNamed(context, "/Profile");
              //     // changeScreen(screen: Constants.profile);
              //     // Navigator.of(context, rootNavigator: true).push(
              //     //       new CupertinoPageRoute<bool>(
              //     //         fullscreenDialog: true,
              //     //         builder: (BuildContext context) =>
              //     //             new ProfileTwoPage(),
              //     //       ),
              //     //     );
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => ProfileTwoPage()),
              //     // );
              //   },
              // ),
            ),
          ],
        ),
      );
  loginFooter(context) => Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            new GestureDetector(
              onTap: () {
                // changeScreen(screen: "ResetPassword");
                Navigator.of(context, rootNavigator: true).push(
                      new MaterialPageRoute<bool>(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => new ResetPassword(),
                      ),
                    );
              },
              child: new Text(
                "Forgot Password?",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.0),
            new GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                      new CupertinoPageRoute<bool>(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => new Signup(),
                      ),
                    );
              },
              child: new Text(
                "Dont have account? Sign Up",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
