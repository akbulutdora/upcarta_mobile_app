// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import '../screens.dart';
import 'package:auto_route/auto_route.dart';
import '../../../navigation/routes.gr.dart';

import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class FeedScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: FeedScreen(),
    );
  }

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return SafeArea(
      child: AutoTabsRouter.tabBar(
        routes: [
          LatestScreenRoute(),
          TopScreenRoute(),
        ],
        builder: (context, child, controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Upcarta",
                style: kTextStyle3b,
              ),
              leading: Image.asset(
                "assets/images/upcarta-logo-small.png",
                width: 30,
                height: 30,
              ),
              backgroundColor: Colors.white,
              titleSpacing: 0.0,
              //leading: AutoLeadingButton(),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: controller,
                      tabs: <Widget>[
                        Tab(text: 'Latest'),
                        Tab(text: 'Top'),
                      ],
                      unselectedLabelColor: Color(0xffC4C4C4),
                      unselectedLabelStyle: libraryTabBar,
                      labelColor: Color(0xff4E89FD),
                      labelStyle: libraryTabBar),
                ),
              ),
            ),
            body: child,
          );
        },
      ),

      // DefaultTabController(
      //   length: 2,
      //   child: Scaffold(
      //     backgroundColor: Colors.white,
      //     appBar: PreferredSize(
      //       preferredSize: Size.fromHeight(40),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           AppBar(
      //             leading: Image.asset(
      //               "assets/images/upcarta-logo-small.png",
      //               width: 30,
      //               height: 30,
      //             ),
      //             backgroundColor: Colors.white,
      //             elevation: 0,
      //             titleSpacing: 0.0,
      //             title: const Text(
      //               'Explore',
      //               style: TextStyle(
      //                   fontFamily: "SFCompactText-Medium",
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w500,
      //                   fontSize: 22),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Expanded(
      //             flex: 3,
      //             child: TabBar(
      //               isScrollable: true,
      //               labelPadding: EdgeInsets.only(right: 8, bottom: 2),
      //               //çizginin mesafesini ayarlıyor
      //               indicatorPadding: EdgeInsets.only(right: 8),
      //               padding: EdgeInsets.only(left: 16),
      //               indicatorSize: TabBarIndicatorSize.label,
      //               tabs: [
      //                 Text(
      //                   "Latest",
      //                   style: TextStyle(color: Colors.blue),
      //                 ),
      //                 Text("Top", style: TextStyle(color: Colors.blue))
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     body: TabBarView(
      //       children: <Widget>[
      //         LatestView(),
      //         TopView(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
  */
}
