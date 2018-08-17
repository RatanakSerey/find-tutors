import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:find_tutors/ui/pages/students/subjects_detail.dart';

class TutorList extends StatelessWidget {
  final Function changeScreen;
  TutorList({this.changeScreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Tutors List"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => changeScreen(pop: true),
            ),
          ),
          Text("Tutors List"),
          RaisedButton(
            onPressed: () => changeScreen(screen: "SubjectDetail"),
            child: new Text("Go To Subject Detail"),
          ),
        ],
      ),
    );
  }
}
