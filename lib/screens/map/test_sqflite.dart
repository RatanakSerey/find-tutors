import 'package:find_tutors/providers/user.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

class TestSqflite extends StatefulWidget {
  @override
  _TestSqfliteState createState() => _TestSqfliteState();
}

class _TestSqfliteState extends State<TestSqflite> {
  UserProvider userProvider = new UserProvider();
  insertUser() {
    userProvider
        .insert(
            User(userId: "xxx", username: "yiman", email: "yiman@gamil.com"))
        .then((user) => print(user));
    // Navigator.popUntil(
    //     context, ModalRoute.withName(Navigator.defaultRouteName));
  }

  getUser() {
    userProvider.getUser().then((user) => print(user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: insertUser,
            child: Text("Insert user"),
          ),
          RaisedButton(
            onPressed: getUser,
            child: Text('get user'),
          ),
          RaisedButton(
            child: Text("Test sqflite"),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => TestSqflite(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
