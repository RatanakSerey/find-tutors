import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppTranslations {
  Locale locale;
  static Map<dynamic, dynamic> _localisedValues;

  AppTranslations(Locale locale) {
    this.locale = locale;
    _localisedValues = null;
  }

  // static AppTranslations of(BuildContext context) {
  //   return Localizations.of<AppTranslations>(context, AppTranslations);
  // }

  Future<AppTranslations> load(Locale locale) async {
    AppTranslations appTranslations = AppTranslations(locale);
    String jsonContent = await rootBundle
        .loadString("assets/locale/localization_${locale}.json");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  String text(String key) {
    return _localisedValues[key] ?? "$key not found in json files";
  }
}

AppTranslations translate = new AppTranslations(Locale("km"));
