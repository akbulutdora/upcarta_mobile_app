// BERNA
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/service/auth_service.dart';
import '../../models/user.dart';
import 'package:upcarta_mobile_app/ui/components/circle_image.dart';
import 'package:upcarta_mobile_app/ui/components/content_list.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: ProfileScreen(),
    );
  }

  //final User user;

  const ProfileScreen({
    Key? key,
    //required this.user,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();
  final fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/upcarta-logo-small.png",
          width: 30,
          height: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0.0,
        title: const Text(
          'Explore',
          style: TextStyle(
              fontFamily: "SFCompactText-Medium",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: SizedBox(child: buildTabController()))],
      ),
    );
  }
/*
  Widget buildMenu() {
    return ListView(
      children: [
        buildDarkModeRow(),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            // 1
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
            // 2
            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }
*/
  /*
  Widget buildDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: widget.user.darkMode,
            onChanged: (value) {
             // Provider.of<ProfileManager>(context, listen: false).darkMode =
             //     value;
            },
          )
        ],
      ),
    );
  }
  */

  Widget buildTabController() {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                pinned: true,
                bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  labelPadding: EdgeInsets.only(right: 5, left: 5),
                  labelStyle: TextStyle(fontSize: 14),
                  tabs: [
                    Tab(text: "Overview"),
                    Tab(text: "Content"),
                    Tab(text: "Recs"),
                    Tab(text: "Collections"),
                    Tab(text: "Asks")
                  ],
                ),
                expandedHeight: 375,
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
              Column(
                children: [
                  //ContentList(
                  //contentList: contents,
                  //),
                ],
              ),
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
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CircleImage(
                  imageProvider: AssetImage("assets/images/mock.jpg"),
                  //widget.user.profileImageUrl),
                  imageRadius: 55.0,
                ),
                MaterialButton(
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
                    //Provider.of<AppStateManager>(context, listen: false)
                    //    .follow('followUsername');
                  },
                ),
              ]),
              const SizedBox(height: 10.0),
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
                //'@${widget.user.username}',
                thisUser.username,
                style: TextStyle(
                  fontFamily: "SFCompactText",
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                //widget.user.bio,
                thisUser.bio,
                style: TextStyle(
                  fontFamily: "SFCompactText",
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Row(children: [
                        Text(
                          //'${widget.user.followers}',
                          thisUser.followers.toString(),
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          ' followers',
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        )
                      ]),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 8.0),
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text(
                        //'${widget.user.following}',
                        thisUser.following.toString(),
                        style: TextStyle(
                          fontFamily: "SFCompactText",
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' following',
                        style: TextStyle(
                          fontFamily: "SFCompactText",
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    CircleImage(
                      imageProvider: AssetImage("assets/images/mock.jpg"),
                      //widget.user.profileImageUrl),
                      imageRadius: 20.0,
                    ),
                    Text(
                      'Also followed by "mutualFollowed" and others',
                      //this appears if there are mutuals and make others appear when there are more
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        );
      }),
    );
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
