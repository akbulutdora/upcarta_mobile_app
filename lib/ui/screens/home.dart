// DORA
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      child: Home(),
    );
  }

  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User user;

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_outlined,
                color: AppColors.secondary,
                size: 30,
              ))
        ],
        elevation: 0,
        titleSpacing: 0.0,
        leading: Icon(
          Icons.pause_circle,
          size: 30,
          color: AppColors.primary,
        ),
        title: const Text(
          'Upcarta',
          style: kAppBarTextStyle,
        ),
        backgroundColor: Colors.white,
      ),
      routes: const [
        FeedScreenRoute(),
        ExploreScreenRoute(),
        NewPostScreenRoute(),
        MyLibraryScreenRoute(),
        ProfileScreenRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          showSelectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(
                Icons.home,
              ),
              label: 'Home Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              activeIcon: Icon(Icons.search),
              label: 'Explore Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'New Action Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              activeIcon: Icon(Icons.bookmark),
              label: 'My Library  Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile Screen',
            ),
          ],
        );
      },
    );
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundImage: AssetImage(
            'assets/images/mock.jpg',
          ),
        ),
        onTap: () {
          // Provider.of<ProfileManager>(context, listen: false)
          //     .tapOnProfile(true);
        },
      ),
    );
  }
}
