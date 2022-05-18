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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                      onPressed: () {
                        context.router.push(NotificationsScreenRoute());
                      }, //TODO: open notification page
                      icon: Icon(Icons.notifications_none_outlined),
                      color: Colors.black,
                      iconSize: 30),
                )
              ],
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
    );
  }
}
