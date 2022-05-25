import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit(this._sharedPrefs)
      : super(_sharedPrefs.getBool('isLight') == null ||
                _sharedPrefs.getBool('isLight')!
            ? _lightTheme
            : _darkTheme);

  final SharedPreferences _sharedPrefs;

  static final _lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    if (state.brightness == Brightness.dark) {
      emit(_lightTheme);
      _sharedPrefs.setBool('isLight', true);
    } else {
      emit(_darkTheme);
      _sharedPrefs.setBool('isLight', false);
    }
  }
}
