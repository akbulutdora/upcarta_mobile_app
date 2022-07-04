import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

// TODO: ADD THEME FEATURES
ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.upcartaBlue,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.upcartaBlue,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColors.black,
    unselectedItemColor: AppColors.gray3ContentText,
    backgroundColor: Colors.white,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      side: MaterialStateProperty.all(
        BorderSide(
          color: AppColors.upcartaBlue,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
  dividerTheme: DividerThemeData(
    color: AppColors.lightDivider,
  ),
  inputDecorationTheme: InputDecorationTheme(
      //TODO:update the focused border
      border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.lightDivider,
    ),
  )),
  chipTheme: ChipThemeData(
    disabledColor: AppColors.white,
    selectedColor: AppColors.upcartaBlue,
  ),
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.darkPrimary,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.darkPrimary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColors.darkPrimary,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.black,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      side: MaterialStateProperty.all(
        BorderSide(
          color: AppColors.darkPrimary,
        ),
      ),
    ),
  ),
  dividerTheme: DividerThemeData(
    color: AppColors.darkDivider,
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.darkDivider,
    ),
  )),
  chipTheme: ChipThemeData(
    disabledColor: AppColors.black,
    selectedColor: AppColors.darkPrimary,
  ),
  brightness: Brightness.dark,
);
