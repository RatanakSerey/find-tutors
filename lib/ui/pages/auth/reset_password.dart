import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResetPassword extends StatelessWidget {
  // final Function changeScreen;
  // ResetPassword({this.changeScreen});
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Column(
    //     children: <Widget>[
    //       // AppBar(
    //       //   title: Text("reset password"),
    //       //   leading: IconButton(
    //       //     icon: Icon(Icons.arrow_back),
    //       //     onPressed: () => changeScreen(pop: true),
    //       //   ),
    //       // ),
    //       Text("Reset Password"),
    //       // RaisedButton(
    //       //   onPressed: () => changeScreen(pop: true),
    //       //   child: Text("Back to SignIn"),
    //       // ),
    //       // Center(
    //       //   child: new Text('Reset Password'),
    //       // child: RaisedButton(
    //       //   onPressed: () {
    //       //     Navigator.pop(context);
    //       //   },
    //       //   child: Text('Go back!'),
    //       // ),
    //       // ),
    //     ],
    //   ),
    // );
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
