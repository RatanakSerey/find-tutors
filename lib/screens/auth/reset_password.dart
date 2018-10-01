//packages
import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/utils/icon_font.dart';
import 'signup.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    resetHeader(context),
                    SizedBox(
                      height: 10.0,
                    ),
                    resetFields(context),
                    SizedBox(
                      height: 10.0,
                    ),
                    resetFooter(context)
                  ],
                ))));
  }

  resetHeader(context) => Container(
          // margin: new EdgeInsets.only(top: 20.0),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // FlutterLogo(
          //   colors: Colors.green,
          //   size: 80.0,
          // ),

          Image.asset(
            'assets/images/forgot_password.png',
            width: 300.0,
            height: 300.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Forgot Your Password ?",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFF4E54C8),
                fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Enter your email below to reset your account...",
            style: TextStyle(color: Color(0xFF4E54C8)),
          ),
        ],
      ));
  resetFields(context) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: CommonColors.primary,
                width: 0.5,
                style: BorderStyle.solid),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
              child: Icon(
                FeatherIcons.mail,
                color: CommonColors.primary,
                size: 20.0,
              ),
            ),
            new Expanded(
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  // labelText: "Username",
                  // contentPadding: EdgeInsets.only(bottom: 0.0),
                  border: InputBorder.none,
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: CommonColors.primary),
                ),
              ),
            ),

          ],
        ),
        // child:
      );
  resetFooter(context) => Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            new GestureDetector(
              onTap: () {
                // Navigator.of(context, rootNavigator: true).push(
                //   new MaterialPageRoute<bool>(
                //     fullscreenDialog: true,
                //     builder: (BuildContext context) => new SignupPage(),
                //   ),
                // );
                Navigator.pushNamed(context, Routes.signin);
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
