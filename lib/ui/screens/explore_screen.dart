import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:auto_route/auto_route.dart';


class ExploreScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const ExploreScreen(),
    );
  }

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.cyan,);
  }
}
