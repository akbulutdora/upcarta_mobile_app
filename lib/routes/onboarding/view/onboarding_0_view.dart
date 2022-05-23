// İDİL

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import '../../../navigation/routes.gr.dart';

class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: OnboardingScreen(),
    );
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              context.router.replace(const HomeRoute());
            },
            child: const Text("Go To Home Screen"),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, color: Colors.blue[400]),
            Text(" Upcarta",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.025))
          ],
        ),
      ),
      // body: UserOnboarding2(),
      body: const AutoRouter(),
    );
  }
}
