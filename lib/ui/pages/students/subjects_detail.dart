import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'import/Signin.dart';

class SubjectsDetail extends StatelessWidget {
  final Function changeScreen;
  SubjectsDetail({this.changeScreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Subject Detail"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => changeScreen(pop: true),
            ),
          ),
          Text("Subject Detail"),
          RaisedButton(
            onPressed: () => 
            Navigator.pushNamed(context, "/Tutors Detail"),
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
