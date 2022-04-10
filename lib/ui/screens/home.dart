// DORA
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';

import 'package:upcarta_mobile_app/blocs/navigation/constants/nav_bar_items.dart';
import 'package:upcarta_mobile_app/blocs/navigation/navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            unselectedItemColor: Colors.grey,
            currentIndex: widget.currentTab,
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.explore);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.newItem);
              } else if (index == 3) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.myLibrary);
              } else if (index == 4) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.search);
              }
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
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return HomeScreen();
          } else if (state.navbarItem == NavbarItem.explore) {
            return MyExploreScreen();
          } else if (state.navbarItem == NavbarItem.newItem) {
            return NewPostScreen();
          } else if (state.navbarItem == NavbarItem.myLibrary) {
            return MyLibraryScreen();
          } else if (state.navbarItem == NavbarItem.search) {
            return SearchScreen();
          }
          return Container();
        },
      ),
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
