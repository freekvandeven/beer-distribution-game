import 'package:flutter/material.dart';

List<Locale> getSupportedLanguages() {
  return [
    const Locale('en', 'US'),
    const Locale('nl', 'NL'),
  ];
}

String getLanguageTitle(Locale locale) {
  return {'en': 'English', 'nl': 'Nederlands'}[locale.languageCode] ?? '';
}
