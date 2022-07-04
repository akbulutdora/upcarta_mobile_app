import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/user_repository.dart';
import '../cubit/onboarding_cubit.dart';

import 'dart:math';

class UserOnboarding3 extends StatefulWidget {
  const UserOnboarding3({Key? key}) : super(key: key);

  @override
  State<UserOnboarding3> createState() => _UserOnboarding3State();
}

class _UserOnboarding3State extends State<UserOnboarding3> {
  List<String> followList = [];
  final FirebaseFirestore _firestoreDB = FirebaseFirestore.instance;

  Future fetchData() async {
    var x = await _firestoreDB
        .collection('Person')
        .where('id',
            isNotEqualTo: firebase_auth.FirebaseAuth.instance.currentUser?.uid)
        .get();

    List<dynamic> data = x.docs.map((value) {
      return value.data();
    }).toList();

    return data;
  }

  List<Map<String, String>> users = [
    {
      'name': 'Person A',
      'about':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl.'
    },
    {
      'name': 'Person B',
      'about':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl.'
    },
    {
      'name': 'Person C',
      'about':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl.'
    },
    {
      'name': 'Person D',
      'about':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl.'
    },
    {
      'name': 'Person E',
      'about':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at fringilla odio. Proin vitae turpis euismod, consectetur tortor quis, tempor nisl.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => OnboardingCubit(context.read<UserRepository>()),
      // child: Container(),
      child: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Please wait its loading...'));
            } else {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<dynamic> peopleList = snapshot.data as List<dynamic>;
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, top: height * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Follow 5 or More People From Upcarta',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.02),
                          ),
                          const Divider(
                              thickness: 2, color: Colors.blue, height: 10),
                          SizedBox(height: height * 0.01),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 10),
                        itemCount: peopleList.length,
                        itemBuilder: (BuildContext context, int index) {
                          // return BlocConsumer<OnboardingCubit, OnboardingState>(
                          //     listener: (context, state) {},
                          //     builder: (context, state) {
                          return Person(
                              id: peopleList[index]?['id'],
                              name: peopleList[index]['username']!,
                              about: peopleList[index]['bio']!,
                              image: peopleList[index]?['photoURL'] ?? '',
                              follow: () {
                                followList.add(peopleList[index]['username']!);
                                // context
                                //     .read<OnboardingCubit>()
                                //     .followUserWithID(peopleList[index]?["id"]);
                              },
                              unfollow: () {
                                followList.removeWhere((element) =>
                                    element == peopleList[index]['username']);
                                // context
                                //     .read<OnboardingCubit>()
                                //     .unfollowUserWithID(
                                //         peopleList[index]?["id"]);
                              });
                          // });
                        },
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                color: Colors.black12)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.05,
                            height * 0.02, width * 0.05, height * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                // context.router.push(UserOnboarding3Route());
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                    color: Color(0xFF949494), fontSize: 18),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                if (kDebugMode) {
                                  print(followList);
                                }
                                context.router
                                    .push(const UserOnboarding4Route());
                              },
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                    color: Color(0xFF4E89FD), fontSize: 18),
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
          }),
    );
  }
}

class Person extends StatefulWidget {
  const Person(
      {Key? key,
      required this.id,
      required this.name,
      required this.about,
      required this.image,
      required this.follow,
      required this.unfollow})
      : super(key: key);

  final String id;
  final String name;
  final String about;
  final String image;
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
                // foregroundImage: NetworkImage(widget.image),
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
                            id: widget.id,
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
      required this.id,
      required this.isFollowing,
      required this.follow,
      required this.unfollow})
      : super(key: key);
  final String id;
  bool isFollowing;
  final VoidCallback follow;
  final VoidCallback unfollow;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return OutlinedButton(
            onPressed: () {
              widget.isFollowing
                  ? {
                      widget.unfollow(),
                      context
                          .read<OnboardingCubit>()
                          .unfollowUserWithID(widget.id)
                    }
                  : {
                      widget.follow(),
                      context
                          .read<OnboardingCubit>()
                          .followUserWithID(widget.id)
                    };

              setState(() {
                widget.isFollowing = !widget.isFollowing;
              });
            },
            style: OutlinedButton.styleFrom(
                minimumSize: Size.zero,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            child: widget.isFollowing
                ? const Text('Unfollow',
                    style: TextStyle(fontSize: 14, color: Colors.grey))
                : const Text(
                    'Follow',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
          );
        });
  }
}
