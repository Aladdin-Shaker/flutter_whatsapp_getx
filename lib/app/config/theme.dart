import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/config/constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: fontFamily,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: kSecondaryColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: _appBarTheme(),
    textTheme: _textTheme(),
  );
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme(color: kTextLigntColor, elevation: 1);
}

TextTheme _textTheme() {
  return const TextTheme();
}
