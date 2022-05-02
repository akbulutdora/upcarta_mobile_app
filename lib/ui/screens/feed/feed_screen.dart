// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/content_list.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/src/authentication.dart';
import 'package:provider/provider.dart';
import '../screens.dart';
import 'package:auto_route/auto_route.dart';
import '../../../navigation/routes.gr.dart';

import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class FeedScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: FeedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.tabBarColor,
          elevation: 0,
          toolbarHeight: 0,
          //titleTextStyle: libraryTabBar,
          bottom: const TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: 'Latest'),
                Tab(text: 'Top'),
              ],
              unselectedLabelColor: Color(0xffC4C4C4),
              unselectedLabelStyle: libraryTabBar,
              labelColor: Color(0xff4E89FD),
              labelStyle: libraryTabBar),
        ),
        body: const TabBarView(
          children: <Widget>[
            LatestView(),
            TopView()
          ],
        ),
      ),
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TabBar(
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(right: 8, bottom: 2),
                    //çizginin mesafesini ayarlıyor
                    indicatorPadding: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Text(
                        "Latest",
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text("Top", style: TextStyle(color: Colors.blue))
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              LatestView(),
              TopView(),
            ],
          ),
        ),
      ),
    );
  }
  */
}
