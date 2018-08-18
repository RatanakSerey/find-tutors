import 'package:flutter/material.dart';
import 'package:find_tutors/utils/constants.dart';
// Style Component
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Widget
import 'package:find_tutors/ui/widgets/bottom_navigation.dart';
// Page
import 'package:find_tutors/home.dart';
import 'package:find_tutors/ui/pages/map/map.dart';
import 'package:find_tutors/ui/pages/tutors/profile.dart';
import 'package:find_tutors/ui/pages/notfound_page.dart';
import 'package:find_tutors/ui/pages/students/tutors_detail.dart';

class App extends StatelessWidget {
  final routes = {
    Constants.homeRoute: (BuildContext context) => Home(),
    Constants.mapRoute: (BuildContext context) => MapPage(),
    Constants.profileRoute: (BuildContext context) => ProfileTwoPage(),
    Constants.tutorsDetailRoute: (BuildContext context) => TutorsDetail(),
  };
  final theme = ThemeData(
      primaryColor: Color(0xFF4E54C8),
      fontFamily: Constants.quickFont,
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
