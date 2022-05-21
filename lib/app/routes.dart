import 'package:flutter/widgets.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [Home.page(0)];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
