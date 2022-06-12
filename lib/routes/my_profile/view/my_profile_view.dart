import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';

import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/routes/my_profile/my_profile.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

bool isPrivate = false;

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
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/upcarta-logo-small.png",
          width: 30.w,
          height: 30.h,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          'Your Profile',
          style: TextStyle(
              fontFamily: "SFCompactText-Medium",
              color: Theme.of(context).iconTheme.color,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
        actions: <Widget>[
          IconButton(
              icon: isPrivate
                  ? Icon(
                      Icons.lock_open_rounded,
                    )
                  : Icon(Icons.lock_outline_rounded),
              onPressed: () {
                setState(() {
                  isPrivate = !isPrivate;
                });
              }),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () async {
              context.router.push(const SettingsRoute());
            },
          ),
        ],
      ),
      //),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 455.h, //DOKUNMA BUNA
              child: buildTabController(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabController() {
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              floating: true,
              pinned: true,
              elevation: 0.2,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: BuildProfile(),
              ),
              //remove the default back button
              bottom: TabBar(
                indicatorWeight: 2.25,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).primaryColor,
                labelPadding: const EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                indicatorPadding: const EdgeInsets.all(0),
                isScrollable: true,
                tabs: const <Widget>[
                  //Tab(text: "Overview"),
                  //Tab(text: "Content"),
                  Tab(text: "Recommends"),
                  //Tab(text: "Collections"),
                  //Tab(text: "Asks")
                ],
                unselectedLabelColor: Theme.of(context).dividerTheme.color,
                unselectedLabelStyle: TextStyle(
                    fontFamily: 'SFCompactText-SemiBold.ttf',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
                labelColor: Theme.of(context).primaryColor,
                labelStyle: TextStyle(
                    fontFamily: 'SFCompactText-SemiBold.ttf',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              expandedHeight: 455.h, //BUNA DA DOKUNMA

              // This is where you build the profile part
            ),
          ];
        },
        body: TabBarView(
          children: [
            //Column(),
            //Column(),
            ProfileRecommendationsList(
                uid: context.read<UserBloc>().state.user.id),
            //Column(),
            //Column(),
          ],
        ),
      ),
    );
  }
}

class BuildProfile extends StatelessWidget {
  List<dynamic> listOfItems = [];
  List<dynamic> listOfItems2 = [];

  BuildProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
      final double width = MediaQuery.of(context).size.width;
      final double height = MediaQuery.of(context).size.height;
      bool isMyProfile = true;

      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
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
                  radius: 60.r,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              //widget.user.name,
              state.user.name ?? "NAME IS NULL",
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Theme.of(context).iconTheme.color,
              ), // bold
            ),
            Text(
              "@${state.user.username ?? 'username null'}",
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8.h),
            isMyProfile
                ? MaterialButton(
                    padding: EdgeInsets.fromLTRB(16.w, 2.h, 16.w, 2.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        side:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontFamily: "SFCompactText",
                          color: Theme.of(context).primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    height: 46.h,
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
            SizedBox(height: 8.h),
            Text(
              " ${state.user.bio}",
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: SizedBox(
                height: 42.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(children: [
                        Text(
                          //'${widget.user.following}',
                          state.user.recommendationCount.toString(),
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        Text(
                          '   Recommendations',
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 26.h,
                      width: 6.w,
                      child: VerticalDivider(
                          color: Theme.of(context).primaryColor),
                    ),
                    TextButton(
                      onPressed: () async {
                        listOfItems = await context
                            .read<UserBloc>()
                            .getFollowerNames(state.user.followerIDs);
                        await showDialog(
                            context: context,
                            builder: (_) => Dialog(
                                    child: Column(children: [
                                  const SizedBox(height: 10),
                                  ...listOfItems.map((item) {
                                    return FollowerInstance(
                                      followerName: item['followerName'],
                                      followerUName: item['followerUName'],
                                    );
                                  }).toList(),
                                ])));
                      },
                      child: Row(children: [
                        Text(
                          state.user.followerIDs == null
                              ? "0"
                              : state.user.followerIDs!.length.toString(),
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        Text(
                          '   Followers',
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 26.h,
                      width: 6.w,
                      child: VerticalDivider(
                          color: Theme.of(context).primaryColor),
                    ),
                    TextButton(
                      onPressed: () async {
                        listOfItems2 = await context
                            .read<UserBloc>()
                            .getFollowingNames(state.user.followingIDs);
                        await showDialog(
                            context: context,
                            builder: (_) => Dialog(
                                    child: Column(children: [
                                  const SizedBox(height: 10),
                                  ...listOfItems2.map((item) {
                                    return FollowerInstance(
                                      followerName: item['followerName'],
                                      followerUName: item['followerUName'],
                                    );
                                  }).toList(),
                                ])));
                      },
                      child: Row(children: [
                        Text(
                          state.user.followingIDs == null
                              ? "0"
                              : state.user.followingIDs!.length.toString(),
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        Text(
                          '   Following',
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 75.h,
            )
          ],
        ),
      );
    }));
  }
}

class FollowerInstance extends StatefulWidget {
  FollowerInstance({
    Key? key,
    required this.followerName,
    required this.followerUName,
  }) : super(key: key);
  String followerName;
  String followerUName;

  @override
  State<FollowerInstance> createState() => _FollowerInstanceState();
}

class _FollowerInstanceState extends State<FollowerInstance> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(" ${widget.followerName}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(" @${widget.followerUName}",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Divider(thickness: 1, height: 0),
          ],
        ),
      ),
    );
  }
}
