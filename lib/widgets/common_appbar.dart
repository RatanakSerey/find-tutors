import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final Function onPress;
  final IconData icon;
  final Color leadingColor;
  final Color backgroundColor;
  CommonAppBar(
      {this.title = "No title",
      this.icon = Icons.menu,
      this.leadingColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.onPress});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(icon),
          color: leadingColor,
          onPressed: () {
            if (onPress == null) {
              return null;
            } else {
              return onPress();
            }
          }),
      title: Text(
        this.title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
