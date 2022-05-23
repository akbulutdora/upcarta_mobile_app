// BERNA
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/service/auth_service.dart';
import '../../models/user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import '../../models/content.dart';
import 'package:upcarta_mobile_app/ui/components/circle_image.dart';
import '../components/content_list.dart';
import '../components/recommended_by.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: ProfileScreen(),
    );
  }

  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();
  final fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;

  bool bioExists = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        title: const Text(
          "Upcarta",
          style: TextStyle(
              fontFamily: "SFCompactText-Medium",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
        leading: Image.asset(
          "assets/images/upcarta-logo-small.png",
          width: 30,
          height: 30,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black54,
            ),
            onPressed: () async {
              context.router.push(const SettingsRoute());
            },
          )
        ],
      ),
      //),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: SizedBox(child: buildTabController()))],
      ),
    );
  }

  Widget buildTabController() {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                pinned: true,
                automaticallyImplyLeading: false,
                //remove the default back button
                bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  labelPadding: EdgeInsets.only(right: 3, left: 3),
                  labelStyle: TextStyle(fontSize: 14),
                  tabs: [
                    Tab(text: "Overview"),
                    Tab(text: "Content"),
                    Tab(text: "Recs"),
                    Tab(text: "Collections"),
                    Tab(text: "Asks")
                  ],
                ),
                expandedHeight: bioExists?
                height / 2
                : height / 2.7,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: buildProfile(),

                  // This is where you build the profile part
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Column(),
              Column(),
              Column(),
              Column(),
              Column(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfile() {
    return FutureBuilder(
        future: getUser(),
        builder: ((context, AsyncSnapshot snapshot) {
          User thisUser = User.empty(
            asksIDs: [],
            collectionsIDs: [],
            followerIDs: [],
            followingIDs: [],
            joinDate: DateTime.now(),
          );
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(
              "ERROR",
              style: TextStyle(color: Colors.red),
            );
          }
          thisUser = snapshot.data! as User;

          final double width = MediaQuery.of(context).size.width;
          final double height = MediaQuery.of(context).size.height;
          bool isMyProfile = true;

          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleImage(
                  imageProvider: AssetImage("assets/images/mock.jpg"),
                  //imageProvider: AssetImage(thisUser.avatar),
                  imageRadius: 45.0,
                ),
                Text(
                  //widget.user.name,
                  thisUser.name,
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ), // bold
                ),
                Text(
                  '@${thisUser.username}',
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                isMyProfile
                    ? MaterialButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.blue)),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontFamily: "SFCompactText",
                              color: Colors.blue,
                              fontSize: 15),
                        ),
                        onPressed: () async {
                          context.router.push(const EditProfileRoute());
                        },
                      )
                    : MaterialButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                              fontFamily: "SFCompactText",
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        onPressed: () async {
                          //follow functionality
                        },
                      ),
                bioExists
                    ? Text(
                        thisUser.bio,
                        style: TextStyle(
                          fontFamily: "SFCompactText",
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      )
                    : SizedBox(
                        height: 2,
                      ),
                Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Row(children: [
                            Text(
                              //'${widget.user.following}',
                              thisUser.recommendationCount.toString(),
                              style: TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ' Recommendations',
                              style: TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 22,
                          child: VerticalDivider(color: Colors.blue),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(children: [
                            Text(
                              thisUser.followers.toString(),
                              style: TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ' Followers',
                              style: TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 22,
                          child: VerticalDivider(color: Colors.blue),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(children: [
                            Text(
                              thisUser.following.toString(),
                              style: TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ' Following',
                              style: TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            )
                          ]),
                        ),
                      ]),
                ),
                SizedBox(height: height * 0.020),
              ],
            ),
          );
        }));
  }

  Future<User?> getUser() async {
    final docRef = _firestore.collection("Person").doc(_auth.currentUser!.uid);
    Future<User?> myUser = docRef.get().then(
      (res) {
        print("Successfully completed" + res.data()!.toString());
        if (res.data() != null) {
          User myUser = User.fromJson(res.data()!);
          return myUser;
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return myUser;
  }
}
