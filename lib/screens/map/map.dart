//packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CommonAppBar(
            onPress: () => Scaffold.of(context).openDrawer(),
          ),
          RaisedButton(
            child: Text("bottomSheet"),
            onPressed: () {
              CommonBottomSheet(context: context).show();
            },
          ),
          RaisedButton(
            child: Text("snackbar"),
            onPressed: () {
              CommonSnackBar(context: context, content: "HI").show();
            },
          ),
          RaisedButton(
            child: Text("alert dialog"),
            onPressed: () {
              CommonAlertDialog(context: context, actions: [
                FlatButton(
                  textColor: CommonColors.primary,
                  child: Text("Okay"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ]).show();
            },
          ),
          RaisedButton(
            child: Text("alert dialog yes no"),
            onPressed: () {
              CommonAlertDialog(context: context).showYesNo();
            },
          ),
        ],
      ),
    );
  }
}
