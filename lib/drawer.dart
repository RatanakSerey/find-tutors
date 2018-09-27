import 'package:find_tutors/services/localization/app_translations.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/widgets/app_icon.dart';
import 'package:find_tutors/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({this.onTabMenuTap});
  final Function onTabMenuTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            closeIcon(context),
            header(context),
            menu(context, onTabMenuTap)
          ],
        ),
      ),
    );
  }
}

Widget closeIcon(context) => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

Widget header(context) => Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppIcon(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileTile(
                title: translate.text("appName"),
                subtitle: "V ${Constants.version}",
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );

Widget menu(context, onTabMenuTap) => Expanded(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          new GestureDetector(
            child: new Text(
              translate.text("home"),
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pop(context);
              onTabMenuTap(0);
            },
          ),
          SizedBox(height: 25.0),
          new GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onTabMenuTap(2);
            },
            child: new Text(
              translate.text("map"),
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25.0),
          new GestureDetector(
            onTap: () {
              onTabMenuTap(1);
              Navigator.pop(context);
            },
            child: new Text(
              translate.text("profile"),
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25.0),
          new GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'otherPage');
            },
            child: new Text(
              translate.text("setting"),
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25.0),
          new GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/Tutor Profile");
            },
            child: new Text(
              translate.text("about"),
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25.0),
          new GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/Tutor Profile");
            },
            child: new Text(
              translate.text("feedback"),
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
