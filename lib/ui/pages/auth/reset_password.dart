import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Second Screen"),
      ),
      body: Center(
        child: new Text('Reset Password'),
        // child: RaisedButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Text('Go back!'),
        // ),
      ),
    );
  }
}