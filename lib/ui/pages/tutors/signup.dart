import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:find_tutors/ui/widgets/custom_background.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // title: Text("Second Screen"),
            ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            CustomBackground(
              showIcon: false,
            ),
          ],
        ));
  }
}
