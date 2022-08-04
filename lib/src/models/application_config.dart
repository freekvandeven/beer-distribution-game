// store all the application configs like language and theme
import 'package:flutter/material.dart';

@immutable
class ApplicationConfiguration {
  const ApplicationConfiguration({
    required this.language,
  });
  final String language;
}
