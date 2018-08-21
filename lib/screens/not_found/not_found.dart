//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';

class NotFound extends StatelessWidget {
  final appTitle;
  final title;
  final message;
  final IconData icon;
  final String image;
  final iconColor;

  NotFound(
      {this.appTitle = "Search",
      this.title = "No Result",
      this.message = "Try a more general keyword.",
      this.icon = Icons.search,
      this.image,
      this.iconColor = Colors.black});

  Widget bodyData() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 100.0,
              color: iconColor,
            ),
            SizedBox(
              height: 20.0,
            ),
            // ProfileTile(
            //   title: title,
            //   subtitle: message,
            // )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appTitle: appTitle,
      bodyData: bodyData(),
      showDrawer: false,
      showFAB: false,
    );
  }
}