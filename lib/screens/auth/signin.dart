// //packages
import 'package:find_tutors/utils/change_screen.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/widgets/app_icon.dart';
import 'package:find_tutors/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/utils/icon_font.dart';
//screens
import 'signup.dart';
import 'package:find_tutors/screens/auth/reset_password.dart';

class SignInWidget extends StatefulWidget {
  final List screens;
  final Function changeScreen;
  SignInWidget({this.screens, this.changeScreen});
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
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

class SigninPage extends StatelessWidget {
  final Function changeScreen;
  const SigninPage({
    this.changeScreen,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height -
          kBottomNavigationBarHeight -
          28.0,
      decoration: BoxDecoration(
        color: Colors.white10,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.10), BlendMode.dstATop),
          image: AssetImage('assets/images/Map.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loginHeader(),
            SizedBox(
              height: 30.0,
            ),
            loginFields(context),
            loginFooter(context)
            // ChangeScreen(screen: this.screens[this.screens.length - 1])
          ]),
    ));
  }

  loginHeader() => Container(
          // margin: new EdgeInsets.only(top: 70.0),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppIcon(),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome to ${Constants.appName}",
            style: TextStyle(fontWeight: FontWeight.w700, color: CommonColors.primary, fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Sign in to access your account.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ));
  loginFields(context) => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.grey, width: 0.7, style: BorderStyle.solid),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Expanded(
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: TextStyle(color: CommonColors.primary),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          labelStyle: TextStyle(color: CommonColors.primary),
                          icon: Icon(
                            FeatherIcons.mail,
                            size: 20.0,
                            color: CommonColors.primary,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.grey, width: 0.7, style: BorderStyle.solid),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Expanded(
                    child: TextField(
                      style: TextStyle(color: CommonColors.primary),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        icon: Icon(
                          FeatherIcons.lock,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0,
                ),
                width: double.infinity,
                child: GradientButton(
                  onPressed: () {},
                  text: 'Sign in',
                )),
          ],
        ),
      );
  loginFooter(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30.0),
            new GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  new MaterialPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => new ResetPasswordPage(),
                  ),
                );
              },
              child: new Text(
                "Forgot Password?",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account? "),
                new GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      new CupertinoPageRoute<bool>(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => new SignupPage(),
                      ),
                    );
                  },
                  child: new Text(
                    " Sign Up",
                    textAlign: TextAlign.center, style: TextStyle(color: CommonColors.primary)
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
