//packages
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/utils/tools/arc_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomBackground extends StatelessWidget {
  final showIcon;
  final image;
  CustomBackground({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new Flexible(
      flex: 3,
      child: ClipPath(
        clipper: new ArcClipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                colors: CommonColors.kitGradients,
              )),
            ),
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 5,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
