// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import '../../../navigation/routes.gr.dart';

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
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<AppBloc>().add(AppLogoutRequested());
                      AutoRouter.of(context).replace(LoginScreenRoute());
                    },
                  )
                ],
                title: const Text(
                  'Upcarta',
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        isScrollable: true,
                        indicatorWeight: 2.25,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: EdgeInsets.only(left: 8, right: 8),
                        controller: controller,
                        tabs: <Widget>[
                          Tab(text: 'Latest'),
                          Tab(text: 'Top'),
                        ],
                        unselectedLabelColor: Color(0xffC4C4C4),
                        unselectedLabelStyle: TextStyle(
                            fontFamily: 'SFCompactText-SemiBold.ttf',
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        labelColor: Color(0xff4E89FD),
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
