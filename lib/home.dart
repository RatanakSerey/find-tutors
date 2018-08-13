import 'package:flutter/material.dart';
import 'package:find_tutors/ui/pages/students/subjects.dart';

import 'package:find_tutors/ui/widgets/backdrop.dart';
import 'package:find_tutors/ui/widgets/theme.dart';
import 'package:find_tutors/ui/widgets/drawer.dart';
import 'package:find_tutors/about.dart';
import 'app.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Tutors',
      home: Backdrop(
        frontLayer: SubjectList(),
        backLayer: CommonDrawer(),
        frontTitle: Text('HOME'),
        backTitle: Text('MENU'),
      ),
      
      // initialRoute: '/login',
      // onGenerateRoute: _getRoute,
      theme: kShrineTheme,
    );
    
  }
}