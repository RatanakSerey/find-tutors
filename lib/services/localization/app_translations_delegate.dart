import 'dart:async';

import 'package:flutter/material.dart';
import './app_translations.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  static List languageList = [
    "en",
    "km",
  ];
  final Locale newLocale;

  const AppTranslationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return [
      "en",
      "km",
    ].contains(locale);
  }

  @override
  Future<AppTranslations> load(Locale locale) async {
    return await AppTranslations.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }

  static Iterable<Locale> supportedLocales() =>
      languageList.map<Locale>((language) => Locale(language, ""));
}
