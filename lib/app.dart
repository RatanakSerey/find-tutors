//packages
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import './services/localization/app_translations_delegate.dart';
import './services/localization/application.dart';
import './provider/index.dart';
import './models/index.dart';
import './provider/index.dart';
//widget
//utils
import 'package:find_tutors/utils/index.dart';
//screens
import 'package:find_tutors/screens/index.dart';
import 'package:find_tutors/bottom_navigation.dart';

class AppRootWidget extends StatefulWidget {
  @override
  AppRootWidgetState createState() {
    return new AppRootWidgetState();
  }
}

class AppRootWidgetState extends State<AppRootWidget> {
  final FirebaseStorage storage;
  AppTranslationsDelegate _newLocaleDelegate;

  UserProvider userProvider = new UserProvider();

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
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    // init user
    // final appStateProvider = AppStateProvider.of(context);
    // print(appStateProvider);
    // final container = AppStateContainer.of(context);

    // userProvider.getUser().then((user) {
    //   container.setUser(User.fromMap(user[0]));
    // }).catchError((err) => print(err));

    return MaterialApp(
        title: Constants.appName,
        theme: theme,
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: TabNavigator(),
        // initialRoute: UIData.notFoundRoute,
        // onGenerateRoute: _getRoute,
        routes: routes,
        localizationsDelegates: [
          const AppTranslationsDelegate(),
          //provides localised strings
          GlobalMaterialLocalizations.delegate,
          //provides RTL support
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: application.supportedLocales(),
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
