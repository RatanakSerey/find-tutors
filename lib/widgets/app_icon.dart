import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      child: Image.asset(Images.appIcon, height: 80.0),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}
