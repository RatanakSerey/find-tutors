import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'import/Signin.dart';

class SubjectsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
          middle: Text('Subjects Detail'),
          leading: new CupertinoButton(
            child: const Text('Back'),
            // icon: Icon(Icons.arrow_back_ios),
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ),
        child: Center(
          child: new Text('Subjects Detail'),
        ));
  }
}