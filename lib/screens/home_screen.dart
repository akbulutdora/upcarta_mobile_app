// DORA
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';

class HomeScreen extends StatelessWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: UpcartaPages.home,
      key: ValueKey(UpcartaPages.home),
      child: HomeScreen(),
    );
  }
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,);
  }
}
