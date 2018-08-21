import 'package:flutter/material.dart';
import 'package:find_tutors/utils/constants.dart';

class GradientButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  GradientButton({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          height: 40.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: CommonColors.kitGradients,
          )),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
