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

  static _showModalSheets(context) {
    ModalSheet.modalBottomSheetMore(context);
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
                new RaisedButton(
                  onPressed: () => _showModalSheets(context),
                  child: new Text("Bottom Sheet"),
                ),
                new RaisedButton(
                  onPressed: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (context) => ProfileTwoPage()),
                    Navigator.of(context, rootNavigator: true).push(
                        new CupertinoPageRoute<bool>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) =>
                              new ProfileTwoPage(),
                        ),
                  );
                  },
                  child: new Text("Route"),
                ),
              ],
            )),
          ),
        ),
      );

  Widget header() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.white,
                // backgroundImage: AssetImage(UIData.pkImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Heng YouSour",
                  subtitle: "sourkh@gmail.com",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
}
