// İDİL

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'package:upcarta_mobile_app/models/models.dart';

class OnboardingScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: UpcartaPages.onboardingPath,
      key: ValueKey(UpcartaPages.onboardingPath),
      child: const OnboardingScreen(),
    );
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black,
      width: 50,
      height: 50,
      child: Padding(
        padding: EdgeInsets.all(100),
        child: MaterialButton(
          color: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: const Text(
            'Onboard and go to Home',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            Provider.of<AppStateManager>(context, listen: false)
                .completeOnboarding();
          },
        ),
      ),);
  }
}
