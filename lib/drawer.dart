import 'package:find_tutors/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[closeIcon(context), header(context), menu(context)],
    )));
  }
}

Widget closeIcon(context) =>
    Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        color: Colors.black,
        onPressed: () => Navigator.pop(context),
      )
    ]);
Widget header(context) => Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              colors: Colors.green,
              size: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileTile(
                title: "Find Tutors",
                subtitle: "V 0.01",
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
Widget menu(context) => Expanded(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          new GestureDetector(
            child: new Text(
              "Home",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              print("Hello world");
            },
          ),
          SizedBox(height: 25.0),
          new GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/Tutor Profile");
            },
            child: new Text(
              "Map",
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
              "Profile",
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
              "Setting",
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
              "About",
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
              "FeedBack",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
