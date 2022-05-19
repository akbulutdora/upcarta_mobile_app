// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/app/app.dart';
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
          final user = context.select((AppBloc bloc) => bloc.state.user);
          print("HERE" + user.email!);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    context.read<AppBloc>().add(AppLogoutRequested());
                    AutoRouter.of(context).push(LoginScreenRoute());
                  },
                )
              ],
              title: Text(
                user.email!,
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
    );
  }
}
