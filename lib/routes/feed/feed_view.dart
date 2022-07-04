import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';


class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return const MaterialPage(
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
        routes: const [
          LatestScreenRoute(),
          TopScreenRoute(),
        ],
        builder: (context, child, controller) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Upcarta',
                  style: TextStyle(
                      fontFamily: 'SFCompactText-Medium',
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
                elevation: 0.8,
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications,
                        color: Theme.of(context).appBarTheme.foregroundColor),
                    onPressed: () {
                      AutoRouter.of(context)
                          .push(const NotificationsScreenRoute());
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Theme.of(context).appBarTheme.foregroundColor,
                    ),
                    onPressed: () {
                      context.read<AppBloc>().add(AppLogoutRequested());
                      AutoRouter.of(context).replace(const LoginScreenRoute());
                    },
                  )
                ],
                leading: Image.asset(
                  'assets/images/upcarta-logo-small.png',
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
                titleSpacing: 0.0,
                //leading: AutoLeadingButton(),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        isScrollable: true,
                        indicatorWeight: 2.25,
                        indicatorColor: Theme.of(context).primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: const EdgeInsets.only(left: 8, right: 8),
                        controller: controller,
                        tabs: const <Widget>[
                          Tab(text: 'Latest'),
                          Tab(text: 'Top'),
                        ],
                        unselectedLabelColor:
                            Theme.of(context).dividerTheme.color,
                        unselectedLabelStyle: const TextStyle(
                            fontFamily: 'SFCompactText-SemiBold.ttf',
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        labelColor: Theme.of(context).primaryColor,
                        labelStyle: const TextStyle(
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
