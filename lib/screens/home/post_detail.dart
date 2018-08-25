//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';

class PostDetailPage extends StatelessWidget {
  final Function changeScreen;
  PostDetailPage({this.changeScreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CommonAppBar(
            title: 'Post Detail',
            onPress: () => Scaffold.of(context).openDrawer(),
          ),
          Text("Post Detail"),
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
