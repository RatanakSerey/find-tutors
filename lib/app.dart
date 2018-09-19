//packages
import 'package:find_tutors/app_state_container.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import './services/localization/app_translations_delegate.dart';
import './providers/index.dart';
import './models/index.dart';
//widget
//utils
import 'package:find_tutors/utils/index.dart';
//screens
import 'package:find_tutors/screens/index.dart';
import 'package:find_tutors/bottom_navigation.dart';

class AppRootWidget extends StatefulWidget {
  @override
  _AppRootWidgetState createState() {
    return new _AppRootWidgetState();
  }
}

class _AppRootWidgetState extends State<AppRootWidget> {
  // final FirebaseStorage storage;
  UserProvider userProvider = new UserProvider();
  // AppTranslationsDelegate _newLocaleDelegate;
  final routes = {
    Routes.mapRoute: (BuildContext context) => MapPage(),
    Routes.profileRoute: (BuildContext context) => ProfileTwoPage(),
    Routes.tutorsDetailRoute: (BuildContext context) => TutorsDetailPage(),
  };

  final theme = ThemeData(
      primaryColor: Color(0xFF4E54C8),
      fontFamily: Fonts.abelFont,
      primarySwatch: Colors.amber);

  @override
  void initState() {
    super.initState();
    // _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
  }

  @override
  Widget build(BuildContext context) {
    final stateContainer = AppStateContainer.of(context).state;
    print(stateContainer);
    return MaterialApp(
        title: Constants.appName,
        theme: ThemeData(
            primaryColor: Color(0xFF4E54C8),
            fontFamily: Fonts.abelFont,
            primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: TabNavigator(),
        // initialRoute: UIData.notFoundRoute,
        // onGenerateRoute: _getRoute,
        routes: routes,
        // localizationsDelegates: [
        // // _newLocaleDelegate,
        // const AppTranslationsDelegate(),
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // ],
        supportedLocales: AppTranslationsDelegate.supportedLocales(),
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
