// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

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
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Upcarta',
                  style: kTextStyle3b,
                ),
                leading: Image.asset(
                  "assets/images/upcarta-logo-small.png",
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
                titleSpacing: 0.0,
                //leading: AutoLeadingButton(),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        isScrollable: true,
                        indicatorWeight: 2.25,
                        indicatorColor: Theme.of(context).primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: EdgeInsets.only(left: 8, right: 8),
                        controller: controller,
                        tabs: <Widget>[
                          Tab(text: 'Latest'),
                          Tab(text: 'Top'),
                        ],
                        unselectedLabelColor: Theme.of(context).dividerTheme.color,
                        unselectedLabelStyle: TextStyle(
                            fontFamily: 'SFCompactText-SemiBold.ttf',
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        labelColor: Theme.of(context).primaryColor,
                        labelStyle: TextStyle(
                            fontFamily: 'SFCompactText-SemiBold.ttf',
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              body: child,
            ),
          );
        },
      ),
    );
  }
}
