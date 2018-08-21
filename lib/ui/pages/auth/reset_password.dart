import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/ui/widgets/gradient_button.dart';
import 'package:find_tutors/utils/constants.dart';
import 'signup.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      children: <Widget>[
        resetHeader(),
        resetFields(context),
        resetFooter(context)
      ],
    ))));
  }

  resetHeader() => Container(
      margin: new EdgeInsets.only(top: 20.0),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              width: double.infinity,
              child: GradientButton(onPressed: (){}, text: Constants.reset_password,)
            ),
          ],
        ),
      );
  resetFooter(context) => Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            new GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                      new MaterialPageRoute<bool>(
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
