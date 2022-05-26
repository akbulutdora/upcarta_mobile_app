import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/models/user.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
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
  // final AuthService _authService = AuthService();
  final fire_auth.FirebaseAuth _auth = fire_auth.FirebaseAuth.instance;

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
            icon: const Icon(
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
                bottom: const TabBar(
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
                expandedHeight: height / 2,
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
          User thisUser = User.empty;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text(
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
                  imageProvider: NetworkImage(thisUser.photoURL!),
                  //widget.user.profileImageUrl),
                  imageRadius: 55.0,
                ),
                Text(
                  //widget.user.name,
                  thisUser.name!,
                  style: const TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ), // bold
                ),
                Text(
                  '@${thisUser.username}',
                  style: const TextStyle(
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
                            side: const BorderSide(color: Colors.blue)),
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
                Text(
                  thisUser.bio!,
                  style: const TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Row(children: [
                            Text(
                              //'${widget.user.following}',
                              thisUser.recommendationCount.toString(),
                              style: const TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
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
                        const SizedBox(
                          height: 22,
                          child: VerticalDivider(color: Colors.blue),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(children: [
                            Text(
                              thisUser.followers.toString(),
                              style: const TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
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
                        const SizedBox(
                          height: 22,
                          child: VerticalDivider(color: Colors.blue),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(children: [
                            Text(
                              thisUser.following.toString(),
                              style: const TextStyle(
                                fontFamily: "SFCompactText",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
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
    String url = await FirebaseStorage.instance
        .ref()
        .child('Amadeo Modigliani - Ritratto di Paul Guillaume 1916.jpg')
        .getDownloadURL();

    final docRef = _firestore.collection("Person").doc(_auth.currentUser!.uid);
    Future<User?> myUser = docRef.get().then(
      (res) {
        if (res.data() != null) {
          User myUser = User.fromJson(res.data()!);
          //myUser.photoURL = url;
          return myUser;
        }
        return null;
      },
      onError: (e) => print("Error completing: $e"),
    );

    return myUser;
  }
}
