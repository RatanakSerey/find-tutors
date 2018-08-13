import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Second Screen"),
      ),
      body: Center(
        child: new Text('Sudent Sign Up'),
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