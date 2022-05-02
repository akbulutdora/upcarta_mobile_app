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
          margin: EdgeInsets.symmetric(vertical: height * 0.05),
          color: Colors.grey,
          height: width * 0.85,
          width: width * 0.85,
        ),
        SizedBox(
          width: width * 0.6,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Welcome to Upcarta\n",
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: height * 0.024,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue[400],
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2,
                    shadows: [Shadow(offset: Offset(0, - height * 0.007), color: Colors.black)],
                  ),
                ),
                TextSpan(
                  text: "Connect your account and follow the people on your twitter.",
                  style: TextStyle(fontSize: height * 0.016, fontWeight: FontWeight.normal, height: height * 0.0015),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 32),
          child: ElevatedButton(
            onPressed: () {
              context.router.push(UserOnboarding2Route());
            },
            child: Text(
              "Connect Your Twitter",
              style: TextStyle(color: Colors.white, fontSize: height * 0.02),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(width * 0.75, min(height * 0.06, width * 0.12)),
              primary: Colors.blue[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.02, width * 0.05, height * 0.05),
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
