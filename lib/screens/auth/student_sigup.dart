import 'dart:async';
import 'dart:convert';
import 'package:find_tutors/services/localization/app_translations.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/utils/snack_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class StudentSignupPage extends StatefulWidget {
  @override
  _StudentSignupPageState createState() {
    return new _StudentSignupPageState();
  }
}

class _StudentSignupPageState extends State<StudentSignupPage> {
  BuildContext _context;

  void initiateFacebookLogin() async {
    var a = await FacebookLogin().isLoggedIn;
    print(a);
    var facebookLoginResult = await FacebookLogin()
        .logInWithReadPermissions(['email', 'public_profile']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.loggedIn:
        FacebookAccessToken accessToken = facebookLoginResult.accessToken;
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture.height(200),first_name,last_name,email&access_token=${accessToken.token}');
        var profile = json.decode(graphResponse.body);

        Map<String, dynamic> data = {
          "username": profile["name"]
              .toString()
              .toLowerCase()
              .replaceAll(new RegExp(r"\s+\b|\b\s"), ""),
          "email": profile["email"],
          "password": "123456",
          "profile": {
            "type": "student",
            "id": profile["id"],
            "firstName": profile["first_name"],
            "lastName": profile["last_name"],
            // "photo":
            // "http://graph.facebook.com/v3.1/107353120209205/picture"
            "photo": Uri.encodeComponent(
                "http://graph.facebook.com/v3.1/107353120209205/picture")
          }
        };
        //createUser
        createUser(data, () {
          Map<String, dynamic> studentDoc = {
            "email": profile["email"],
          };
          insertStudent(studentDoc, () {});
        });
//insert information to ft_student
//store local db

//setUser to state container

// print('networ picture: https://graph.facebook.com/v3.1/107353120209205/picture');

//profileData['picture']['data']['url'],
        break;
    }
  }

  Future createUser(Map body, Function callback) async {
    String url = MethodNames.insertUser;
    return http.post(url, body: body).then((response) {
      var result = json.decode(response.body);
      print('result $result');
      if (result["code"] != Constants.FORBIDDEN) {
        callback();
      } else {
        // CommonSnackBar(
        //   context: _context,
        //   type: "danger",
        //   content: result["msg"],
        // ).show();
        // setState(() {
        //     isLoading = false;
        //   });
      }
    }).catchError((err) {
      // CommonSnackBar(
      //   context: _context,
      //   type: "danger",
      //   content: translate.text("serverDisconnect"),
      // ).show();
      // setState(() {
      //   isLoading = false;
      // });
    });
  }

  Future insertStudent(Map body, Function callback) async {
    String url = MethodNames.insertStudent;

    return http.post(url, body: body).then((response) {
      var result = json.decode(response.body);
      print('result $result');
      if (result["code"] != Constants.FORBIDDEN) {
        // callback();
      } else {
        print(result["msg"]);
        // CommonSnackBar(
        //   context: _context,
        //   type: "danger",
        //   content: result["msg"],
        // ).show();
        // setState(() {
        //     isLoading = false;
        //   });
      }
    }).catchError((err) {
      // CommonSnackBar(
      //   context: _context,
      //   type: "danger",
      //   content: translate.text("serverDisconnect"),
      // ).show();
      print(err);

      // setState(() {
      //   isLoading = false;
      // });
    });
  }

  Future logoutFacebook() async {
    await FacebookLogin().logOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Text('student Sign Up'),
          ),
          RaisedButton(
            child: Text("Sign in with facebook"),
            onPressed: initiateFacebookLogin,
          ),
          RaisedButton(
            onPressed: logoutFacebook,
            child: Text("logout facebook"),
          )
        ],
      ),
    );
  }
}
