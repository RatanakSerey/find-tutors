import 'package:find_tutors/models/app_state.dart';
import 'package:find_tutors/models/language.dart';
import 'package:find_tutors/models/user.dart';
import 'package:find_tutors/providers/language.dart';
import 'package:find_tutors/services/localization/app_translations.dart';
import 'package:find_tutors/services/localization/app_translations_delegate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:find_tutors/providers/index.dart';

class AppStateContainer extends StatefulWidget {
  final AppState state;
  final Widget child;

  AppStateContainer({
    @required this.child,
    this.state,
  });

  static _AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  _AppStateContainerState createState() => new _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  AppState state;
  /* user */
  UserProvider userProvider = new UserProvider();
  User currentUser;
  /* language */
  LanguageProvider languageProvider = new LanguageProvider();
  Language currentLanguage;
  AppTranslations translate;

  settingApp() async {
    /* create table */
    await userProvider.createTable();
    await languageProvider.createTable();
    /* get language */
    languageProvider.count().then((res) {
      if (res[0]["count"] == 0) {
        languageProvider
            .insert(Language(code: "km", name: "Khmer"))
            .then((res) {
          setLanguage(res);
        });
      } else {
        setLanguage(Language(code: res[0]["code"], name: res[0]["name"]));
      }
    }).catchError((err) => print(err));
    // userProvider
    //     .insert(
    //         User(username: 'yiman', email: 'yiman@gmail.com', userId: '001'))
    //     .then((res) {
    //       setUser(res);
    //     })
    //     .catchError((err) => print(err));

    /* get user */
    userProvider.getUser().then((res) {
      setUser(User.fromMap(res[0]));
    }).catchError((err) => print(err));
  }

  @override
  void initState() {
    super.initState();
    settingApp();
  }

  void setUser(User user) {
    setState(() {
      currentUser = user;
    });
  }

  void setLanguage(Language language) {
    print(language.toMap());
    languageProvider.update(language, 1).then((res) {
      AppTranslationsDelegate(newLocale: Locale(language.code))
          .load(Locale(language.code))
          .then((appTran) {
        setState(() {
          currentLanguage = language;
          translate = appTran;
        });
      });
    });
  }

  // AppStateContainer --> InheritedStateContainer --> The rest of your app.
  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _AppStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
