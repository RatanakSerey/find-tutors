//packages
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
  final routes = {
    // Constants.homeRoute: (BuildContext context) => Home(),
    Routes.mapRoute: (BuildContext context) => MapWidget(),
    Routes.profileRoute: (BuildContext context) => ProfileTwo(),
    Routes.tutorsDetailRoute: (BuildContext context) => PostDetail(),
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
        builder: (context) => NotFound(
              appTitle: Constants.coming_soon,
              icon: FontAwesomeIcons.solidSmile,
              title: Constants.coming_soon,
              message: "Under Development",
              iconColor: Colors.green,
            ));
  }
}
