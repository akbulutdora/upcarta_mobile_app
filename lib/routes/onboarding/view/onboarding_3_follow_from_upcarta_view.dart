import "package:flutter/material.dart";
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:math';

class UserOnboarding3 extends StatefulWidget {
  const UserOnboarding3({Key? key}) : super(key: key);

  @override
  State<UserOnboarding3> createState() => _UserOnboarding3State();
}

class _UserOnboarding3State extends State<UserOnboarding3> {
  List<String> followList = [];

  List<Map<String, String>> users = [
    {
      "name": "Person A",
      "about":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl."
    },
    {
      "name": "Person B",
      "about":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl."
    },
    {
      "name": "Person C",
      "about":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl."
    },
    {
      "name": "Person D",
      "about":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl."
    },
    {
      "name": "Person E",
      "about":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl."
    },
  ];

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
              Text(
                "Follow 5 or More People From Upcarta",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: height * 0.02),
              ),
              const Divider(thickness: 2, color: Colors.blue, height: 10),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return Person(
                  name: users[index]["name"]!,
                  about: users[index]["about"]!,
                  follow: () {
                    followList.add(users[index]["name"]!);
                  },
                  unfollow: () {
                    followList.removeWhere(
                        (element) => element == users[index]["name"]);
                  });
            },
          ),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, 0), blurRadius: 10, color: Colors.black12)
          ]),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.02, width * 0.05, height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // context.router.push(UserOnboarding3Route());
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Color(0xFF949494), fontSize: 18),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    print(followList);
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
        ),
      ],
    );
  }
}

class Person extends StatefulWidget {
  const Person(
      {Key? key,
      required this.name,
      required this.about,
      required this.follow,
      required this.unfollow})
      : super(key: key);

  final String name;
  final String about;
  final VoidCallback follow;
  final VoidCallback unfollow;

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.03),
          border: Border.all(color: const Color(0xFFC4C4C4), width: 1),
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
                        Text(widget.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        FollowButton(
                            isFollowing: false,
                            follow: widget.follow,
                            unfollow: widget.unfollow),
                      ],
                    ),
                    Text(
                      widget.about,
                      maxLines: 2,
                      style: const TextStyle(
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

class FollowButton extends StatefulWidget {
  FollowButton(
      {Key? key,
      required this.isFollowing,
      required this.follow,
      required this.unfollow})
      : super(key: key);

  bool isFollowing;
  final VoidCallback follow;
  final VoidCallback unfollow;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        widget.isFollowing
            ? {widget.unfollow(), print("unfollow")}
            : {widget.follow(), print("follow")};

        setState(() {
          widget.isFollowing = !widget.isFollowing;
        });
      },
      style: OutlinedButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
      child: widget.isFollowing
          ? const Text("Unfollow",
              style: TextStyle(fontSize: 14, color: Colors.grey))
          : const Text(
              "Follow",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
    );
  }
}
