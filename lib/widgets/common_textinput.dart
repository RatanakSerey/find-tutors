import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/utils/icon_font.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final Color color;
  final Color iconColor;
  final bool hasIcon;
  final IconData iconName;
  final double fontSize;
  final double iconSize;
  final Function onChanged;
  final Function onSubmitted;
  final bool autofocus;
  final bool enabled;
  final bool obscureText;
  final int maxLength;
  final TextInputType keyboardType;
  TextInput({
    this.hint = "",
    this.color = CommonColors.primary,
    this.fontSize = 16.0,
    this.hasIcon = false,
    this.iconName = FeatherIcons.star,
    this.iconSize = 20.0,
    this.iconColor = CommonColors.primary,
    this.onChanged,
    this.autofocus = false,
    this.onSubmitted,
    this.enabled = true,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      autofocus: autofocus,
      enabled: enabled,
      maxLength: maxLength,
      onSubmitted: onSubmitted,
      textAlign: TextAlign.left,
      style: TextStyle(color: color, fontSize: fontSize),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        labelStyle: TextStyle(color: color),
        icon: hasIcon
            ? Icon(
                iconName,
                size: iconSize,
                color: iconColor,
              )
            : null,
      ),
    );
  }
}
