import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:find_tutors/ui/tools/arc_clipper.dart';

class CustomBackground extends StatelessWidget {
  final showIcon;
  final image;
  CustomBackground({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new Flexible(
      flex: 2,
      child: ClipPath(
        clipper: new ArcClipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                colors: AppColors.kitGradients,
              )),
            ),
            showIcon
                ? new Center(
                    child: SizedBox(
                        height: deviceSize.height / 8,
                        width: deviceSize.width / 2,
                        child: FlutterLogo(
                          colors: Colors.yellow,
                        )),
                  )
                : new Container(
                    width: double.infinity,
                    child: image != null
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                          )
                        : new Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 3,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
