// EGECAN
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.dart';

import '../../navigation/routes.gr.dart';


class LoginScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: UpcartaPages.loginPath,
      key: ValueKey(UpcartaPages.loginPath),
      child: const LoginScreen(),
    );
  }
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue,
      width: 50,
      height: 50,
      child: Padding(
      padding: EdgeInsets.all(100),
      child: MaterialButton(
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: const Text(
          'Login and go to Onboarding',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          // Provider.of<AppStateManager>(context, listen: false)
          //     .login('mockUsername', 'mockPassword');
          context.router.push(OnboardingScreenRoute());
        },
      ),
    ),);
  }
}
