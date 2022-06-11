import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';

import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/routes/my_profile/my_profile.dart';

class MyProfileScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: MyProfileScreen(),
    );
  }

  const MyProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        titleSpacing: 0.0,
        title: Text(
          "Your Profile",
          style: TextStyle(
              fontFamily: "SFCompactText-Medium",
              color: Theme.of(context).iconTheme.color,
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
              color: Theme.of(context).iconTheme.color,
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
        children: [
          Expanded(
            child: SizedBox(
              child: buildTabController(),
            ),
          ),
        ],
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
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                floating: true,
                pinned: true,
                automaticallyImplyLeading: false,
                //remove the default back button
                bottom: TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  labelColor: Theme.of(context).iconTheme.color,
                  unselectedLabelColor: Theme.of(context).iconTheme.color,
                  labelPadding: const EdgeInsets.only(right: 3, left: 3),
                  labelStyle: const TextStyle(fontSize: 14),
                  tabs: const [
                    Tab(text: "Overview"),
                    Tab(text: "Content"),
                    Tab(text: "Recs"),
                    Tab(text: "Collections"),
                    Tab(text: "Asks")
                  ],
                ),
                expandedHeight: 500.h,
                flexibleSpace: const FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: BuildProfile(),
                  // This is where you build the profile part
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Column(),
              Column(),
              ProfileRecommendationsList(
                  uid: context.read<UserBloc>().state.user.id),
              Column(),
              Column(),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildProfile extends StatelessWidget {
  const BuildProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
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
            GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (_) => Dialog(
                            child: Column(children: [
                          Expanded(
                            child: Image(
                                // FIXME: ADD NULL CASE
                                image: NetworkImage(state.user.photoURL!)),
                          ),
                        ])));
              },
              child: Hero(
                tag: 'imageHero',
                child: CircleAvatar(
                  // FIXME: ADD NULL IMAGE CASE
                  foregroundImage: state.user.photoURL != null
                      ? NetworkImage(state.user.photoURL!)
                      : null,
                  backgroundImage: const AssetImage("assets/images/mock.jpg"),
                  //widget.user.profileImageUrl),
                  radius: 55.0,
                ),
              ),
            ),
            Text(
              //widget.user.name,
              state.user.name ?? "NAME IS NULL",
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).iconTheme.color,
              ), // bold
            ),
            Text(
              "@${state.user.username ?? 'username null'}",
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
                        side:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontFamily: "SFCompactText",
                          color: Theme.of(context).primaryColor,
                          fontSize: 15),
                    ),
                    onPressed: () async {
                      context.router.push(const EditProfileRoute());
                    },
                  )
                : MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                    child: Text(
                      'Follow',
                      style: TextStyle(
                          fontFamily: "SFCompactText",
                          color: Theme.of(context).primaryColor,
                          fontSize: 18),
                    ),
                    onPressed: () async {
                      //follow functionality
                    },
                  ),
            Text(
              "BIO: ${state.user.bio}",
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      //'${widget.user.following}',
                      state.user.recommendationCount.toString(),
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    Text(
                      ' Recommendations',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 22,
                  child: VerticalDivider(color: Theme.of(context).primaryColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      state.user.followerIDs == null
                          ? "0"
                          : state.user.followerIDs!.length.toString(),
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    Text(
                      ' Followers',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 22,
                  child: VerticalDivider(color: Theme.of(context).primaryColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      state.user.followingIDs == null
                          ? "0"
                          : state.user.followingIDs!.length.toString(),
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    Text(
                      ' Following',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Theme.of(context).iconTheme.color,
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
}
