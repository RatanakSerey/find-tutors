//packages
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';
//screens
import 'package:find_tutors/screens/index.dart';
import 'package:find_tutors/bottom_navigation.dart';

class App extends StatelessWidget {
  final FirebaseStorage storage;

  final routes = {
    // Constants.homeRoute: (BuildContext context) => Home(),
    Routes.mapRoute: (BuildContext context) => MapPage(),
    Routes.profileRoute: (BuildContext context) => ProfileTwoPage(),
    Routes.tutorsDetailRoute: (BuildContext context) => TutorsDetailPage(),
  };
  final theme = ThemeData(
      primaryColor: Color(0xFF4E54C8),
      fontFamily: Fonts.abelFont,
      primarySwatch: Colors.amber);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Constants.appName,
        theme: theme,
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: TabNavigator(),
        // initialRoute: UIData.notFoundRoute,
        // onGenerateRoute: _getRoute,
        routes: routes,
        onUnknownRoute: (RouteSettings rs) => onUnknownRoute(rs));
  }
  onUnknownRoute(RouteSettings rs) {
    return MaterialPageRoute(
        builder: (context) => NotFoundPage(
              appTitle: Constants.coming_soon,
              icon: FontAwesomeIcons.solidSmile,
              title: Constants.coming_soon,
              message: "Under Development",
              iconColor: Colors.green,
            ));
  }
}
