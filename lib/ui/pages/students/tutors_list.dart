import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TutorList extends StatelessWidget {
  final Function changeScreen;
  TutorList({this.changeScreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Tutors List"),
          RaisedButton(
            onPressed: () => changeScreen(screen: Constants.subjectDetail),
            child: new Text("Go To Subject Detail"),
          ),
        ],
      ),
    );
  }
}
