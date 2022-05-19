import 'package:flutter/widgets.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';
import 'package:upcarta_mobile_app/main.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.initial:
      return [SplashScreen.page()];
    case AppStatus.loading:
      return [SplashScreen.page()];
    case AppStatus.authenticated:
      return [Welcome.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen2.page()];
  }
}
