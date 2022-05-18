// BERNA
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/ui/screens/edit_profile.dart';
import '../../models/user.dart';
import 'package:upcarta_mobile_app/ui/components/circle_image.dart';
import 'package:upcarta_mobile_app/ui/components/content_list.dart';

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
bool isMyProfile = true;

class MyFirebaseApp extends StatefulWidget {
  const MyFirebaseApp({Key? key}) : super(key: key);

  @override
  _MyFirebaseAppState createState() => _MyFirebaseAppState();
}

class _MyFirebaseAppState extends State<MyFirebaseApp> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('No Firebase Connection: ${snapshot.error.toString()}'),
              ),
            ),
          );
        }
        if(snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: MyApp(),
          );
        }
        return MaterialApp(
          home: Center(
            child: Text('Connecting to Firebase'),
          ),
        );
      },);
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          title: const Text(
            ,
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
              color: Colors.black26,
            ),
            onPressed: () {
              context.router.replace(const EditProfileRoute());
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
          const SizedBox(height: 10.0),
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
            children: [
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
                    "666",
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
  }
}
