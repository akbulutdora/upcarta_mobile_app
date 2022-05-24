import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/routes.gr.dart';

class InitialScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: InitialScreen(),
    );
  }

  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // comment out next line if you wanna stay on splash screen page more than 2 seconds
  //   // Provider.of<AppStateManager>(context, listen: false).initializeApp();
  // }
  late String? uEmail;
  late String? uPass;
  getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uEmail = prefs.getString("uEmail");
      uPass = prefs.getString("uPass");
    });
  }

  @override
  void initState() {
    super.initState();
    getStatus();
  }

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
                  child: const Text("GO"),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (prefs.getBool("landingCompleted") == null ||
                        (prefs.getBool("landingCompleted")! == false)) {
                      // print(prefs.getBool("landingCompleted"));
                      context.router.push(const LandingRoute());
                    } else {
                      context.router.push(const LoginScreenRoute());
                    }
                    // context.router.push(HomeRoute());
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
