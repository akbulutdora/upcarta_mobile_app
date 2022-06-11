import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';
import 'package:upcarta_mobile_app/routes/other_profile/other_profile.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OtherProfileScreenState createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {
  // final AuthService _authService = AuthService();

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
                  background: BuildOtherProfile(),

                  // This is where you build the profile part
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Column(),
              Column(),
              OtherProfileRecommendationsList(),
              Column(),
              Column(),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildOtherProfile extends StatelessWidget {
  BuildOtherProfile({Key? key}) : super(key: key);
  List<dynamic> listOfItems= [];
  List<dynamic> listOfItems2= [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherProfileBloc, OtherProfileState>(
        builder: ((context, state) {
      print("USER AT OTHER PROFILE VIEW:${state.user.toString()}");
      bool isFollowed = state.user.followerIDs!
          .contains(context.read<AppBloc>().state.user.id);

      final double width = MediaQuery.of(context).size.width;
      final double height = MediaQuery.of(context).size.height;
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [GestureDetector(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (_) => Dialog(
                      child: SizedBox(
                        height: 400.w,
                        width: 400.w,
                        child: CircleAvatar(
                          foregroundImage: state.user.photoURL != null
                              ? NetworkImage(state.user.photoURL!)
                              : null,
                          backgroundImage: const AssetImage("assets/images/mock.jpg"),
                          radius: 400.h,),
                      )));
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
              style: const TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
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
            isFollowed
                ? MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                    child: const Text(
                      'Unfollow',
                      style: TextStyle(
                          fontFamily: "SFCompactText",
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                    onPressed: () async {
                      // TODO: IMPLEMENT BUTTON BEHAVIOR IN BLOC
                      //context.read<OtherProfileBloc>().add();
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
                      // TODO: IMPLEMENT BUTTON BEHAVIOR IN BLOC
                      //context.read<OtherProfileBloc>().add();
                    },
                  ),
            Text(
              "BIO: ${state.user.bio}",
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
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      //'${widget.user.following}',
                      state.user.recommendationCount.toString(),
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
                      onPressed: () async {
                        listOfItems = await context.read<OtherProfileBloc>().getFollowerNames(state.user.followerIDs);
                        await showDialog(
                            context: context,
                            builder: (_) => Dialog(
                                child: Column(
                                    children: [
                                      Text("Followers",
                                        style: TextStyle(
                                          fontFamily: "SFCompactText",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          color: Theme.of(context).iconTheme.color,
                                        ),),
                                      const SizedBox(height: 10),
                                      ...listOfItems.map((item) {
                                        return FollowerInstanceOther(
                                          followerName: item['followerName'],
                                          followerUName: item['followerUName'],
                                        );
                                      }).toList(),
                                    ]
                                )
                            )
                        );
                      },
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
                      onPressed: () async {
                        listOfItems2 = await context.read<OtherProfileBloc>().getFollowingNames(state.user.followingIDs);
                        await showDialog(
                            context: context,
                            builder: (_) => Dialog(
                                child: Column(
                                    children: [Text("Following",
                                      style: TextStyle(
                                        fontFamily: "SFCompactText",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        color: Theme.of(context).iconTheme.color,
                                      ),),
                                      const SizedBox(height: 10),
                                      ...listOfItems2.map((item) {
                                        return FollowerInstanceOther(
                                          followerName: item['followerName'],
                                          followerUName: item['followerUName'],
                                        );
                                      }).toList(),
                                    ]
                                )
                            )
                        );
                      },
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
class FollowerInstanceOther extends StatefulWidget {


  FollowerInstanceOther(
      {Key? key,
        required this.followerName,
        required this.followerUName,
      })
      : super(key: key);
  String followerName;
  String followerUName;
  @override
  State<FollowerInstanceOther> createState() => _FollowerInstanceOtherState();
}

class _FollowerInstanceOtherState extends State<FollowerInstanceOther> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
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
