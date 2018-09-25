import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Images.notFound,
        height: 110.0,
      ),
    );
  }
}
