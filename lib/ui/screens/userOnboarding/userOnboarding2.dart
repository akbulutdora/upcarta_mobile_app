import "package:flutter/material.dart";
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:math';

class UserOnboarding2 extends StatelessWidget {
  const UserOnboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    late int suggestionNumber = 128;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.05, top: height * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Follow People From Your Twitter", style: TextStyle(fontWeight: FontWeight.w500, fontSize: height * 0.02),),
              const Divider(thickness: 2, color: Colors.blue, height: 10),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Text("Select All $suggestionNumber Matches", style: TextStyle(fontSize: height * 0.016),),
                  // TODO: radio button
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return FollowWithRadio();
              },),
          ),
        ),


        Padding(
          padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.02, width * 0.05, height * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  // context.router.push(UserOnboarding3Route());
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Color(0xFF949494), fontSize: 18),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  context.router.push(UserOnboarding3Route());
                },
                child: Text(
                  "Next",
                  style: TextStyle(color: Color(0xFF4E89FD), fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FollowWithRadio extends StatelessWidget {
  const FollowWithRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.03),
          border: Border.all(
            color: const Color(0xFFC4C4C4),
            width: 1
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: min(32, width * 0.08),
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Person A", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("@persona", style: TextStyle(color: Color(0xFF949494), fontSize: 16))
                      ],
                    ),

                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("pressed");
                },
                child: const Text(
                  "Follow",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 36),
                  primary: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
