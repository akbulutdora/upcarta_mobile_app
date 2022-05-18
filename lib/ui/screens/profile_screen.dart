// BERNA
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
  final List<Content> contents = <Content>[
    Content(
        title: "book written by berna",
        id: 2,
        contentType: ContentType.book,
        added_by_id: '',
        link: 'www.google.com',
        description: 'berna',
        created_at: '',
        image:
            'https://i.pinimg.com/originals/e8/15/b9/e815b94b7a82d7c6e2f4c791bf984d98.jpg',
        author_id: ''),
    Content(
        title: "article of idil",
        id: 3,
        contentType: ContentType.article,
        created_at: '',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        link: 'https://lmgtfy.app/?q=dora+the+explorer',
        added_by_id: '',
        image: 'https://images.gamebanana.com/img/ico/sprays/5c8d6b4f8f5ba.png',
        author_id: ''),
    Content(
        title: "podcast about game-dev",
        id: 4,
        contentType: ContentType.podcast,
        description: 'it\'s about game dev',
        created_at: '',
        link: 'URL',
        added_by_id: '',
        image:
            'https://static-cdn.jtvnw.net/ttv-boxart/105451_IGDB-272x380.jpg',
        author_id: ''),
  ];

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
                expandedHeight: 300,
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
                  ContentList(
                    contentList: contents,
                  ),
                ],
              ),
              Column(
                children: [
                  ContentList(
                    contentList: contents,
                  ),
                ],
              ),
              Column(
                children: [
                  ContentList(
                    contentList: contents,
                  ),
                ],
              ),
              Column(
                children: [
                  ContentList(
                    contentList: contents,
                  ),
                ],
              ),
              Column(
                children: [
                  ContentList(
                    contentList: contents,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfile() {
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
            //widget.user.profileImageUrl),
            imageRadius: 45.0,
          ),
          Text(
            //widget.user.name,
            "Idil",
            style: TextStyle(
              fontFamily: "SFCompactText",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ), // bold
          ),
          Text(
            //'@${widget.user.username}',
            "@lidl",
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
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontFamily: "SFCompactText",
                        color: Colors.white,
                        fontSize: 18),
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
            //widget.user.bio,
            "loremipsum",
            style: TextStyle(
              fontFamily: "SFCompactText",
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Row(children: [
                  Text(
                    //'${widget.user.following}',
                    "666",
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
              TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      //'${widget.user.followers}',
                      "666",
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
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 8.0),
                  )),
              TextButton(
                onPressed: () {},
                child: Row(children: [
                  Text(
                    //'${widget.user.following}',
                    "666",
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
                  ),
                ]),
              ),

            ],
          ),
          SizedBox(height: height * 0.020),
        ],
      ),
    );
  }
}
