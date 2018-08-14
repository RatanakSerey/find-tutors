import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_tutors/utils/uidata.dart';
import 'package:find_tutors/ui/pages/tutors/profile.dart';
import 'package:find_tutors/ui/widgets/colors.dart';
import 'signup.dart';
import 'reset_password.dart';
class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SingleChildScrollView(
          child: new Center(
              child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[loginHeader(), loginFields(context)],
      ))),
      // backgroundColor: Colors.white,
      // body: Center(
      //   child: new SingleChildScrollView(
      //   child: loginBody(),)
      // ),
    );
  }
  // loginBody() => Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[loginHeader(), loginFields()],
  //     );

  loginHeader() => Column(
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
            "Welcome to ${UIData.appName}",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
        ],
      );

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
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFF4E54C8),
                onPressed: () {
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, "/Profile");
                  Navigator.of(context, rootNavigator: true).push(
                        new CupertinoPageRoute<bool>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) =>
                              new ProfileTwoPage(),
                        ),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ProfileTwoPage()),
                  // );
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                new GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                        new CupertinoPageRoute<bool>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) =>
                              new ResetPassword(),
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
                          builder: (BuildContext context) =>
                              new Signup(),
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
          ],
        ),
      );
}
