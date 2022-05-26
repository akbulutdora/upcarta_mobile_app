import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

// TODO: ADD THEME FEATURES
ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.upcartaBlue,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.black,
  ),
  brightness: Brightness.dark,
);
