// BENGİSU

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/library/bloc/library_bloc.dart';
import 'package:upcarta_mobile_app/routes/library/library.dart';

//void main() => runApp(const MyLibraryScreen());

class MyLibraryScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: MyLibraryScreen(),
    );
  }

  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LibraryBloc(userRepository: context.read<UserRepository>())
        ..add(LibraryEventContentFetched()),
      child: DefaultTabController(
        initialIndex: 0,
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            titleSpacing: 0.0,
            title: Text(
              'Your Library',
              style: TextStyle(
                  fontFamily: "SFCompactText-Medium",
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            leading: Image.asset(
              "assets/images/upcarta-logo-small.png",
              width: 30,
              height: 30,
            ),
            elevation: 0,
            //titleTextStyle: libraryTabBar,
            bottom: TabBar(
              indicatorWeight: 2.25,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).primaryColor,
              labelPadding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              indicatorPadding: const EdgeInsets.all(0),
              isScrollable: true,
              tabs: const <Widget>[
                Tab(text: 'Saved'),
                //Tab(text: 'Completed'),
                //Tab(text: 'Collections'),
                //Tab(text: 'Recommends'),
              ],
              unselectedLabelColor: Theme.of(context).dividerTheme.color,
              unselectedLabelStyle: const TextStyle(
                  fontFamily: 'SFCompactText-SemiBold.ttf',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              labelColor: Theme.of(context).primaryColor,
              labelStyle: const TextStyle(
                  fontFamily: 'SFCompactText-SemiBold.ttf',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              MyLibrarySavedScreen(),
              //LibraryCompletedView(),
              //LibraryCollectionsView(),
              //LibraryRecommendsView(),
            ],
          ),
        ),
      ),
    );
  }
}
