import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

import 'package:upcarta_mobile_app/util/colors.dart';

class UserOnboarding1 extends StatelessWidget {
  const UserOnboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Image.asset(
            'assets/images/onboardingImage.png',
            height: 315.h,
            width: 315.w,
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: 245.w,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(color: AppColors.black),
                children: [
                  TextSpan(
                    text: '\tWelcome to Upcarta\t',
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.2,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue[400],
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2,
                      shadows: [
                        Shadow(offset: Offset(0, -12.h), color: AppColors.black)
                      ],
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nConnect your account and follow the people on your twitter.',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'SFCompactText-Regular.ttf',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32.h),
            child: ElevatedButton(
              onPressed: () {
                context.router.push(const UserOnboarding2Route());
              },
              child: Text(
                'Connect Your Twitter',
                style: TextStyle(color: AppColors.white, fontSize: 16.sm),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(280.w, 64.h),
                primary: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {
                  context.router.push(const UserOnboarding3Route());
                },
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: AppColors.gray3ContentText)),
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: AppColors.gray3ContentText, fontSize: 16.sm),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
