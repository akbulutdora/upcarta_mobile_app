// İDİL

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';




import '../../navigation/routes.gr.dart';

class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const OnboardingScreen(),
    );
  }
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // List<Widget> Pages = [
  //   UserOnboarding1(),
  //   UserOnboarding2(),
  //   UserOnboarding3(),
  //   UserOnboarding4(),
  // ];
  //
  // int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {context.router.replace(HomeRoute());},
            child: Text("Go To Home Screen"),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, color: Colors.blue[400]),
            Text(" Upcarta", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: height * 0.025))
          ],
        ),
      ),
      body: AutoRouter(),



      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           OutlinedButton(
      //               onPressed: null,
      //               child: Text("Skip"),
      //           ),
      //           OutlinedButton(
      //               onPressed: null,
      //               child: Text("Next"),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
