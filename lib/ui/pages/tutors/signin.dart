import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:find_tutors/ui/widgets/colors.dart';
import 'package:find_tutors/ui/widgets/theme.dart';
import 'profile.dart';
import 'signup.dart';

import 'package:find_tutors/ui/pages/students/tutors_detail.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
          children: <Widget>[
            SizedBox(height: 50.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text(
                  'Home Tutor',
                  style: Theme.of(context).textTheme.headline,
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Column(
              children: <Widget>[
                PrimaryColorOverride(
                  color: kShrineBrown900,
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Username',
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                new PrimaryColorOverride(
                  color: kShrineBrown900,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12.0),
            // Button
            CupertinoButton(
              child: Text(
                'Sign In',
              ),
              borderRadius: BorderRadius.circular(10.0),
              color: kShrineExodus,
              minSize: 40.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                new GestureDetector(
                  onTap: () {
                    print("Hello world");
                  },
                  child: new Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.body1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.0),
                new GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/Tutor Profile");
                  },
                  child: new Text(
                    "Dont have account? Sign Up",
                    style: Theme.of(context).textTheme.body1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
