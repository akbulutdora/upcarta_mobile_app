// CAN

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.splashPath,
      key: ValueKey(FooderlichPages.splashPath),
      child: const SplashScreen(),
    );
  }
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // comment out next line if you wanna stay on splash screen page more than 2 seconds
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.purple,);
  }
}
