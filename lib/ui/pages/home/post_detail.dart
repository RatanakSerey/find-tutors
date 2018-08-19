import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final Function changeScreen;
  PostDetail({this.changeScreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Subject Detail"),
          RaisedButton(
            onPressed: () => 
            Navigator.pushNamed(context, Routes.tutorsDetailRoute),
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
