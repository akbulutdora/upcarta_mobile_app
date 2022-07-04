import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: SplashScreen(),
    );
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
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
                      'assets/images/upcarta-logo-small.png',
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      'Upcarta',
                      style: splashTitleStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
