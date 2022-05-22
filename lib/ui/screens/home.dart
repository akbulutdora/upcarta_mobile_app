// DORA
import 'package:flutter/material.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcarta_mobile_app/models/models.dart';
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
      appBarBuilder: (_, tabsRouter) =>
          PreferredSize(child: Container(), preferredSize: Size(0.0, 0.0)),
      routes: const [
        FeedScreenRoute(),
        ExploreScreenRoute(),
        NewPostScreenRoute(),
        MyLibraryScreenRoute(),
        ProfileScreenRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(
                Icons.home,
              ),
              label: 'Home Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: ImageIcon(
                AssetImage("assets/images/Vector.png"),
                size: 20,
              ),
              label: 'Explore Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle),
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
