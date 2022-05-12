import "package:flutter/material.dart";
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:math';

class UserOnboarding1 extends StatelessWidget {
  const UserOnboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: height * 0.03),
          height: min(width * 0.85, height * 0.4),
          child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset("assets/images/onboardingImage.png")),
        ),
        SizedBox(
          width: width * 0.6,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "\tWelcome to Upcarta\t",
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: min(width * 0.055, 24),
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue[400],
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2,
                    shadows: [
                      Shadow(
                          offset: Offset(0, -height * 0.007),
                          color: Colors.black)
                    ],
                  ),
                ),
                TextSpan(
                  text:
                      "Connect your account and follow the people on your twitter.",
                  style: TextStyle(
                      fontSize: min(width * 0.037, 15),
                      fontWeight: FontWeight.normal,
                      height: 1.2),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height * 0.05),
          child: ElevatedButton(
            onPressed: () {
              context.router.push(UserOnboarding2Route());
            },
            child: Text(
              "Connect Your Twitter",
              style: TextStyle(
                  color: Colors.white, fontSize: min(16, width * 0.043)),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(min(288, width * 0.78), min(48, width * 0.13)),
              primary: Colors.blue[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.02, width * 0.05, height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      context.router.push(UserOnboarding3Route());
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
