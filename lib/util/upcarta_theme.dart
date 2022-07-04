import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcartaTheme {
  static TextTheme lightTextTheme = const TextTheme(
    // Large Title
    titleLarge: TextStyle(
        // fontFamily: "SF Compact Text",
        fontWeight: FontWeight.normal,
        fontSize: 34,
        color: Colors.black),
    // title1 - usages:
    titleMedium: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 28, color: Colors.black),
    // title2 - usages:
    titleSmall: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 22, color: Colors.black),
    // title3 - usages:
    displayLarge: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black),
    // headline
    displayMedium: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 17, color: Colors.black),
    // body
    bodyLarge: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 17, color: Colors.black),
    // callout
    bodyMedium: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
    // subhead
    headlineLarge: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black),
    // footnote
    displaySmall: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black),
    //caption1
    headlineMedium: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
    //caption2
    headlineSmall: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 11, color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      fontFamily: 'SFCompactText',
      brightness: Brightness.light,
      checkboxTheme:
          CheckboxThemeData(fillColor: MaterialStateColor.resolveWith((states) {
        return Colors.black;
      })),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blueAccent,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      fontFamily: 'SFCompactText',
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.deepPurpleAccent,
      ),
      textTheme: darkTextTheme,
    );
  }
}
