// İDİL

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
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
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.router.replace(const HomeRoute());
            },
            icon: const Icon(Icons.home_filled),
            color: AppColors.upcartaBlue,
          ),
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        centerTitle: true,
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/upcarta-logo-small.png',
              height: 30.h, width: 30.w),
          SizedBox(width: 8.w),
          Text(
            'Upcarta',
            style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ]),
      ),
      // body: UserOnboarding2(),
      body: const AutoRouter(),
    );
  }
}
