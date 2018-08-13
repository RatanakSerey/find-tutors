import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Style Component
import 'package:find_tutors/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget
import 'package:find_tutors/ui/widgets/bottom_navigation.dart';

// Page
import 'package:find_tutors/home.dart';
import 'package:find_tutors/ui/pages/map/map.dart';
import 'package:find_tutors/ui/pages/tutors/profile.dart';
import 'package:find_tutors/ui/pages/notfound_page.dart';



class App extends StatelessWidget {
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Color(0xFF4E54C8),
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: Navigate(),
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => Home(),
        UIData.mapRoute: (BuildContext context) => MapPage(),
        UIData.profileRoute: (BuildContext context) => ProfileTwoPage(),
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )));

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}