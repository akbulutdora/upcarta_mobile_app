import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';

import 'package:upcarta_mobile_app/routes/my_profile/my_profile.dart';
import 'package:upcarta_mobile_app/ui_components/follow_list.dart';

import '../../../ui_components/follow_button.dart';
import '../../../ui_components/recommended_by.dart';
import '../../../util/styles.dart';

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
          'assets/images/upcarta-logo-small.png',
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
              fontFamily: 'SFCompactText-Medium',
              color: Theme.of(context).iconTheme.color,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
        actions: <Widget>[
          IconButton(
              icon: isPrivate
                  ? const Icon(
                      Icons.lock_open_rounded,
                    )
                  : const Icon(Icons.lock_outline_rounded),
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
              height: 550.h, //DOKUNMA BUNA
              child: buildTabController(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabController() {
    return RefreshIndicator(
      displacement: 200,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: ()async
      {
        // TODO ADD FUNCTION
        await Future.delayed(Duration(milliseconds: 1500));
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: 5,
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
                  background: ProfileHeader(),
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
                    Tab(child: Text('Overview'), ),
                    Tab(text: "Content"),
                    Tab(text: 'Recommends'),
                    Tab(text: "Collections"),
                    Tab(text: "Asks")
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
                expandedHeight: 400.h, //BUNA DA DOKUNMA
                // This is where you build the profile part
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

class ProfileHeader extends StatelessWidget {
  List<dynamic> listOfItems = [];
  List<dynamic> listOfItems2 = [];

  ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      bool isMyProfile = false;

      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      backgroundImage: const AssetImage('assets/images/mock.jpg'),
                      //widget.user.profileImageUrl),
                      radius: 60.r,
                    ),
                  ),
                ),
                isMyProfile ? MaterialButton(
                  padding: EdgeInsets.fromLTRB(16.w, 2.h, 16.w, 2.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      side:
                      BorderSide(color: Theme.of(context).primaryColor)),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontFamily: 'SFCompactText',
                        color: Theme.of(context).primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  height: 46.h,
                  onPressed: () async {
                    context.router.push(const EditProfileRoute());
                  },
                ) : FollowButton(heightt: 45.h, widthh: 105.h,),
              ],
            ),
            SizedBox(height: 16.h),
            /// name
            Text(
              //widget.user.name,
              state.user.name ?? 'NAME IS NULL',
              style: TextStyle(
                fontFamily: 'SFCompactText',
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Theme.of(context).iconTheme.color,
              ), // bold
            ),
            /// @username
            Text(
              "@${state.user.username ?? 'username null'}",
              style: TextStyle(
                fontFamily: 'SFCompactText',
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 12.h),
            ///bio
            Text(
              ' ${state.user.bio}',
              style: TextStyle(
                fontFamily: 'SFCompactText',
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,

              ),
            ),
            SizedBox(height: 12.h,),
            Wrap(
              spacing: 20,
              children: [
                Wrap(
                  spacing: 5,
                  children: [
                    Text(
                      '1.2k',
                      style: kTabBarTextStyle.copyWith(
                          fontWeight: FontWeight.bold, ),
                    ),
                    RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Followers',
                              style: kTabBarTextStyle.copyWith(color: Theme.of(context).primaryColorDark),
                              recognizer: TapGestureRecognizer()..onTap = ()
                                {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const FollowerPage()));
                                }
                            ),
                        ],
                        ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    Text(
                      '200',
                      style: kTabBarTextStyle.copyWith(
                        fontWeight: FontWeight.bold, ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Following',
                              style: kTabBarTextStyle.copyWith(color: Theme.of(context).primaryColorDark),
                              recognizer: TapGestureRecognizer()..onTap = ()
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const FollowerPage()));
                              }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            isMyProfile ? Container() :  RecommendedBy(recommenders: [
              {
                'image': 'imageLink',
                'username': 'person A',
                'color': '0xFF34E8EB'
              },
              {
                'image': 'imageLink',
                'username': 'person B',
                'color': '0xFF20B3E8'
              },
              {
                'image': 'imageLink',
                'username': 'person C',
                'color': '0xFF206AE8'
              },
              {
                'image': 'imageLink',
                'username': 'person D',
                'color': '0xFF5322E6'
              },
            ]) ,
          ],
        ),
      );
    });
  }
}




