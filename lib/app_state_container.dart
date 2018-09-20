import 'dart:async';

import 'package:find_tutors/models/language.dart';
import 'package:find_tutors/models/user.dart';
import 'package:find_tutors/providers/language.dart';
import 'package:find_tutors/services/localization/app_translations.dart';
import 'package:find_tutors/services/localization/app_translations_delegate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:find_tutors/providers/index.dart';

class AppStateContainer extends StatefulWidget {
  final Widget child;

  AppStateContainer({
    @required this.child,
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
  UserProvider userProvider = new UserProvider();
  LanguageProvider languageProvider = new LanguageProvider();
  /* states */
  bool isLoading = true;
  User currentUser;
  Language currentLanguage;
  AppTranslations translate;

  @override
  void initState() {
    super.initState();
  }

  void ready() {
    setState(() {
      isLoading = false;
    });
  }

  void setUser(User user) {
    setState(() {
      currentUser = user;
    });
  }

  void setLanguage(Language language) {
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
