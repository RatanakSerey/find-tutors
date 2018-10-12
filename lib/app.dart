//packages
import 'dart:async';

import 'package:find_tutors/models/language.dart';
import 'package:find_tutors/models/user.dart';
import 'package:find_tutors/providers/language.dart';
import 'package:find_tutors/providers/user.dart';
import 'package:find_tutors/screens/auth/reset_password.dart';
import 'package:find_tutors/screens/auth/signin.dart';
import 'package:find_tutors/screens/auth/signup.dart';
import 'package:find_tutors/screens/auth/student_sigup.dart';
import 'package:find_tutors/screens/home/tutors_detail.dart';
import 'package:find_tutors/screens/map/map.dart';
import 'package:find_tutors/screens/not_found/not_found.dart';
import 'package:find_tutors/screens/tutors/profile.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './services/localization/app_translations_delegate.dart';
import 'package:find_tutors/app_state_container.dart';
import 'package:find_tutors/bottom_navigation.dart';

class AppRootWidget extends StatefulWidget {
  @override
  _AppRootWidgetState createState() {
    return new _AppRootWidgetState();
  }
}

class _AppRootWidgetState extends State<AppRootWidget>
    with SingleTickerProviderStateMixin {
  bool isBuilt = true;
  BuildContext _context;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  // final FirebaseStorage storage;
  UserProvider userProvider = new UserProvider();
  LanguageProvider languageProvider = new LanguageProvider();
  User user;
  // AppTranslationsDelegate _newLocaleDelegate;
  final routes = {
    Routes.root: (BuildContext context) => TabNavigator(),
    Routes.map: (BuildContext context) => MapPage(),
    Routes.teacherProfile: (BuildContext context) => TeacherProfilePage(),
    Routes.signin: (BuildContext context) => SigninPage(),
    Routes.signup: (BuildContext context) => SignupPage(),
    Routes.studentSignup: (BuildContext context) => StudentSignupPage(),
    Routes.teacherSignup: (BuildContext context) => TeacherSignupPage(),
    Routes.resetPassword: (BuildContext context) => ResetPasswordPage(),
    Routes.tutorsDetail: (BuildContext context) => TutorsDetailPage(),
  };

  Future initialization() async {
    final stateContainer = AppStateContainer.of(_context);
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
      appReady();

      /* getUser */
      // userProvider.getUser().then((res) {
      //   if(res){
      //   stateContainer.setUser(User.fromMap(res[0]));
      //   }
      //   /* app is ready */
      //   stateContainer.setScaffoldKey(scaffoldKey);

      //   appReady();
      // }).catchError((err) => print(err));
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

  void appReady() {
    final stateContainer = AppStateContainer.of(_context);
    const timeOut = const Duration(seconds: 3);
    new Timer(timeOut, () {
      stateContainer.setScaffoldKey(scaffoldKey);
      stateContainer.ready();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget get _pageToDisplay {
    final stateContainer = AppStateContainer.of(_context);
    if (!stateContainer.isLoading) {
      return TabNavigator();
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  ThemeData get themeData {
    final stateContainer = AppStateContainer.of(_context);
    return ThemeData(
      // brightness: Brightness.dark,
      primaryColor: Color(0xFF4E54C8),
      accentColor: CommonColors.accent,
      // canvasColor: Colors.transparent,
      fontFamily: stateContainer.currentLanguage != null
          ? stateContainer.currentLanguage.code == "en"
              ? Fonts.dinNextFont
              : Fonts.khBoeungFont
          : null,
      primarySwatch: Colors.amber,
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    if (isBuilt) {
      isBuilt = false;
      initialization();
    }

    return MaterialApp(
        title: Constants.appName,
        theme: themeData,
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: _pageToDisplay,
        // initialRoute: UIData.notFoundRoute,
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
          ),
    );
  }
}
