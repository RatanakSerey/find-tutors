//packages
import 'dart:async';

import 'package:find_tutors/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './services/localization/app_translations_delegate.dart';
//widget
//utils
import 'package:find_tutors/utils/index.dart';
import 'package:find_tutors/app_state_container.dart';
//model
import 'package:find_tutors/models/language.dart';
//provider
import 'package:find_tutors/providers/language.dart';
import 'package:find_tutors/providers/user.dart';
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
  LanguageProvider languageProvider = new LanguageProvider();
  User user;
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
  }

  Future initialization(stateContainer) async {
    /* create table */
    await userProvider.createTable();
    await languageProvider.createTable();

    /* getLanguage */
    languageProvider.count().then((res) {
      if (res[0]["count"] == 0) {
        languageProvider
            .insert(Language(code: "km", name: "Khmer"))
            .then((res) {
          stateContainer.setLanguage(res);
        });
      } else {
        stateContainer
            .setLanguage(Language(code: res[0]["code"], name: res[0]["name"]));
      }

      /* getUser */
      userProvider.getUser().then((res) {
        stateContainer.setUser(User.fromMap(res[0]));
        /* app is ready */
        appReady(stateContainer);
      }).catchError((err) => print(err));
      //-------------------------------------------------------------------------
      /* insert user */
      // userProvider
      //     .insert(
      //         User(username: 'yiman', email: 'yiman@gmail.com', userId: '001'))
      //     .then((res) {
      //   appReady(stateContainer);
      //   stateContainer.setUser(res);
      // }).catchError((err) => print(err));

      //end language
    }).catchError((err) => print(err));
  }

  void appReady(stateContainer) {
    const timeOut = const Duration(seconds: 2);
    new Timer(timeOut, () {
      stateContainer.ready();
    });
  }

  Widget _pageToDisplay(stateContainer) {
    if (stateContainer.isLoading) {
      initialization(stateContainer);
      return _loadingView;
    } else {
      return _homeView;
    }
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget get _homeView {
    return TabNavigator();
  }

  @override
  Widget build(BuildContext context) {
    final stateContainer = AppStateContainer.of(context);

    return MaterialApp(
        title: Constants.appName,
        theme: ThemeData(
            primaryColor: Color(0xFF4E54C8),
            fontFamily: stateContainer.currentLanguage != null
                ? stateContainer.currentLanguage.code == "en"
                    ? Fonts.abelFont
                    : Fonts.kantumruy
                : null,
            primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: _pageToDisplay(stateContainer),
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
