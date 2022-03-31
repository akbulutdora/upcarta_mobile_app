// DORA
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/screens/new_action_screen.dart';
import 'package:upcarta_mobile_app/screens/screens.dart';

import '../models/models.dart';
import 'home_screen.dart';
import 'my_library_screen.dart';
import 'profile_screen.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: UpcartaPages.home,
      key: ValueKey(UpcartaPages.home),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    const MyExploreScreen(),
    const NewPostScreen(),
    const MyLibraryScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (
        context,
        appStateManager,
        child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Upcarta',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              profileButton(),
            ],
          ),
          body: IndexedStack(
            index: widget.currentTab,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            unselectedItemColor: Colors.grey,
            currentIndex: widget.currentTab,
            onTap: (index) {
              Provider.of<AppStateManager>(context, listen: false)
                  .goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home Screen',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore Screen',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'New Action Screen',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                label: 'My Library  Screen',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search Screen',
              ),
            ],
          ),
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
            'images/mock.jpg',
          ),
        ),
        onTap: () {
          Provider.of<ProfileManager>(context, listen: false)
              .tapOnProfile(true);
        },
      ),
    );
  }
}
