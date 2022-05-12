// CAN

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../../navigation/routes.gr.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // comment out next line if you wanna stay on splash screen page more than 2 seconds
  //   // Provider.of<AppStateManager>(context, listen: false).initializeApp();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              context.router.replace(const HomeRoute());
            },
            child: const Text("Go To Home Screen"),
          ),
          TextButton(
            child: Text("GO TO NEXT"),
            onPressed: () {
              context.router.push(LoginScreenRoute());
            },
          ),
        ],
      ),
    );
  }
}
