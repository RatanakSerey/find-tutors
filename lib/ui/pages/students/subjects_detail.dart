import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';

class SubjectsDetail extends StatelessWidget {
  final Function changeScreen;
  SubjectsDetail({this.changeScreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Subject Detail"),
          RaisedButton(
            onPressed: () => 
            Navigator.pushNamed(context, Constants.tutorsDetailRoute),
            // Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ProfileTwoPage()),
            //     ),
            child: new Text("Go To Tutors Detail"),
          ),
        ],
      ),
    );
  }
}
