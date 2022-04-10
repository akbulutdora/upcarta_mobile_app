import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';

class MyExploreScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: UpcartaPages.loginPath,
      key: ValueKey(UpcartaPages.loginPath),
      child: const MyExploreScreen(),
    );
  }

  const MyExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.cyan,);
  }
}
