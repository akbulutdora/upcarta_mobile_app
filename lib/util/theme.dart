import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/util/colors.dart';




ThemeData lightTheme = ThemeData(

  primaryColor: AppColors.upcartaBlue,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.upcartaBlue,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.black,
    shadowColor: AppColors.gray1BoxFrame
  ),
  cardColor: AppColors.lightCardInside,
  hintColor: AppColors.gray3ContentText,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.black,
    unselectedItemColor: AppColors.gray3ContentText,
    backgroundColor: AppColors.white,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      side: MaterialStateProperty.all(
        const BorderSide(
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
  indicatorColor: AppColors.lightDivider,
  dividerTheme: const DividerThemeData(
    color: AppColors.lightDivider,
  ),
  inputDecorationTheme: InputDecorationTheme(
      //TODO:update the focused border
      border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: AppColors.lightDivider,
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.upcartaBlue, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(10))
  ),
  ),



  chipTheme: const ChipThemeData(
    disabledColor: AppColors.black,
    selectedColor: AppColors.white,
    backgroundColor: AppColors.upcartaBlue,
    shadowColor: AppColors.gray1BoxFrame,
    side: BorderSide(color: AppColors.gray1BoxFrame),
  ),
  brightness: Brightness.light,
  accentColor: AppColors.upcartaBlue,
    tabBarTheme: const TabBarTheme(
        labelColor: AppColors.upcartaBlue,
    ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.darkPrimary,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.darkPrimary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.black,
    foregroundColor: AppColors.darkPrimary,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.darkPrimary,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.black,
  ),
  /// Following two are used for inside and outside of boxes
  cardColor: AppColors.darkCardInside,
  hintColor: AppColors.darkHintColor,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      side: MaterialStateProperty.all(
        const BorderSide(
          color: AppColors.darkPrimary,
        ),
      ),
    ),
  ),
  indicatorColor: AppColors.lightDivider,

  dividerTheme: const DividerThemeData(
    color: AppColors.darkDivider,
  ),
  scaffoldBackgroundColor: AppColors.darkBackground,
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: AppColors.darkDivider,
    ),
  ),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkPrimary, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
  ),
  chipTheme: const ChipThemeData(
    disabledColor: AppColors.black,
    selectedColor: AppColors.white,
    backgroundColor: AppColors.darkPrimary,
  ),

  brightness: Brightness.dark,
  /// FIXME: This works but flutter suggest using colorScheme.secondary which I couldn't for now
  accentColor: AppColors.darkPrimary,

  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.darkPrimary,
    unselectedLabelColor: AppColors.darkHintColor,

  )
);
