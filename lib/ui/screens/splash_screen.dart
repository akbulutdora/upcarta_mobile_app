// CAN

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/ui/screens/home.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:upcarta_mobile_app/service/auth_service.dart';

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

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/upcarta-logo-small.png",
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      "Upcarta",
                      style: splashTitleStyle,
                    )
                  ],
                ),
                TextButton(
                  child: Text("GO LOGIN"),
                  onPressed: () {
                    context.router.push(LoginScreenRoute());
                    // context.router.push(HomeRoute());
                  },
                ),
                TextButton(
                  child: Text("GO HOME"),
                  onPressed: () {
                    // context.router.push(LoginScreenRoute());
                    _authService.signIn("bbgisu@gmail.com", "doradostumdur");
                    context.router.push(HomeRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
