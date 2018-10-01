//packages
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                Navigator.pushNamed(context, Routes.tutorsDetail),
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
