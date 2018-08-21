import 'package:flutter/material.dart';
import 'package:find_tutors/utils/constants.dart';

class GradientButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  GradientButton({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: InkWell(
        onTap: onPressed,
        // splashColor: Colors.yellow,
        child: Ink(
          height: 40.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: AppColors.kitGradients,
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
