import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Widget
import 'package:find_tutors/utils/uidata.dart';
import 'package:find_tutors/ui/widgets/profile_tile.dart';
import 'package:find_tutors/ui/widgets/bottom_modal_sheet.dart';

import 'package:find_tutors/ui/pages/tutors/profile.dart';

class MapPage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return homeScaffold(context);
  }

  Widget homeScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
        child: Scaffold(
          key: _scaffoldState,
          body: new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Center(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('This is Map Page'),
              ],
            )),
          ),
        ),
      );
}
