import "package:flutter/material.dart";
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:math';

class UserOnboarding3 extends StatelessWidget {
  const UserOnboarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.05, top: height * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Follow 5 or More People From Upcarta", style: TextStyle(fontWeight: FontWeight.w500, fontSize: height * 0.02),),
              const Divider(thickness: 2, color: Colors.blue, height: 10),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const Person();
            },),
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
                child: const  Text(
                  "Skip",
                  style: TextStyle(color: Color(0xFF949494), fontSize: 18),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  context.router.push(const UserOnboarding4Route());
                },
                child: const Text(
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

class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: min(32, width * 0.08),
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Person A", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                        OutlinedButton(
                          onPressed: () {
                            print("Follow");
                          },
                          child: const Text("Follow", style: TextStyle(fontSize: 14)),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 0),
                    const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl.",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}