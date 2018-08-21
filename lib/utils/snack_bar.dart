import 'package:find_tutors/utils/index.dart';
import 'package:flutter/material.dart';

class CommonSnackBar {
  BuildContext context;
  String content;
  String type;
  Color backgroundColor;
  Function action;
  int duration;
  String actionLabel = "dismiss";
  CommonSnackBar(
      {@required this.context,
      this.content = "content",
      this.type = "default",
      this.backgroundColor = CommonColors.primary,
      this.action,
      this.duration = 1,
      this.actionLabel = "dismiss"});

  getBackgroundColor() {
    switch (type) {
      case "success":
        return CommonColors.success;
        break;
      case "danger":
        return CommonColors.danger;
        break;
      case "warning":
        return CommonColors.warning;
        break;
      case "info":
        return CommonColors.info;
        break;
      default:
        return CommonColors.primary;
        break;
    }
  }

  show() {
    Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(content),
          backgroundColor: getBackgroundColor(),
          duration: Duration(seconds: duration),
        ));
  }

  showWithAction() {
    Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(content),
          backgroundColor: getBackgroundColor(),
          duration: Duration(seconds: duration),
          action: SnackBarAction(
            label: actionLabel,
            onPressed: () => action(),
          ),
        ));
  }
}
