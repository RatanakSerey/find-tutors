import 'package:find_tutors/utils/index.dart';
import 'package:flutter/material.dart';

class CommonAlertDialog {
  BuildContext context;
  String title;
  String content;
  List<Widget> actions;
  Function yes;
  Function no;

  CommonAlertDialog(
      {@required this.context,
      this.title = "title",
      this.content = "content",
      this.actions,
      this.yes,
      this.no});

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(content),
          actions: actions,
        );
      },
    );
  }

  showYesNo() {
    if (no == null) {
      no = Navigator.of(context).pop;
    }
    if (yes == null) {
      yes = Navigator.of(context).pop;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCEL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              textColor: CommonColors.primary,
              onPressed: () => no(),
            ),
            FlatButton(
              child: Text("OK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              textColor: CommonColors.primary,
              onPressed: () => yes(),
            )
          ],
        );
      },
    );
  }
}