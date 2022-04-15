// DORA
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';
import 'package:upcarta_mobile_app/blocs/navigation/constants/nav_bar_items.dart';
import 'package:upcarta_mobile_app/blocs/navigation/navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';

User mockUser = User(
  name: 'Mana',
  username: 'manaira',
  //how to put @ before?
  role: 'Flutterista',
  avatar: 'assets/images/mock.jpg',
  bio:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fermentum, a id nunc, odio augue enim. Viverra nullam pulvinar volutpat ultricies hendrerit sed. Morbi eget a nisi nulla vulputate vestibulum purus sodales.',
  darkMode: false,
  id: '12345',
  email: 'mana@gmail.com',
  confirmed_at: '',
  reset_password_sent_at: '',
  reset_password_token: '',
  confirmation_sent_at: '',
  password_hash: '',
  confirmation_token: '',
  following: 12,
  followers: 10,
);

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: UpcartaPages.home,
      key: ValueKey(UpcartaPages.home),
      child: Home(
      ),
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
    user = mockUser;
    AutoRouter.of(context);
    return
      // return Scaffold(
      //   appBar: AppBar(
      //     elevation: 0,
      //     titleSpacing:1,
      //     leading: Icon(Icons.pause_circle),
      //     title: const Text(
      //       'Upcarta',
      //       style: kAppBarTextStyle,
      //     ),
      //     actions: [
      //       profileButton(),
      //     ],
      //   ),
      //   bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
      //     builder: (context, state) {
      //       return BottomNavigationBar(
      //         selectedItemColor: Colors.black,
      //         unselectedItemColor: Colors.black,
      //         currentIndex: state.index,
      //         onTap: (index) {
      //           if (index == 0) {
      //             BlocProvider.of<NavigationCubit>(context)
      //                 .getNavBarItem(NavbarItem.home);
      //           } else if (index == 1) {
      //             BlocProvider.of<NavigationCubit>(context)
      //                 .getNavBarItem(NavbarItem.explore);
      //           } else if (index == 2) {
      //             BlocProvider.of<NavigationCubit>(context)
      //                 .getNavBarItem(NavbarItem.newItem);
      //           } else if (index == 3) {
      //             BlocProvider.of<NavigationCubit>(context)
      //                 .getNavBarItem(NavbarItem.myLibrary);
      //           } else if (index == 4) {
      //             BlocProvider.of<NavigationCubit>(context)
      //                 .getNavBarItem(NavbarItem.search);
      //           }
      //         },
      //         showSelectedLabels: false,
      //         items: const <BottomNavigationBarItem>[
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.home_outlined),
      //             activeIcon: Icon(
      //               Icons.home,
      //             ),
      //             label: 'Home Screen',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(
      //               Icons.search,
      //               color: Colors.grey,
      //             ),
      //             activeIcon: Icon(Icons.search),
      //             label: 'Explore Screen',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.add_circle_outline),
      //             label: 'New Action Screen',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.bookmark_border),
      //             activeIcon: Icon(Icons.bookmark),
      //             label: 'My Library  Screen',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.person_outline),
      //             activeIcon: Icon(Icons.person),
      //             label: 'Profile Screen',
      //           ),
      //         ],
      //       );
      //     },
      //   ),
      //   body: BlocBuilder<NavigationCubit, NavigationState>(
      //     builder: (context, state) {
      //       if (state.navbarItem == NavbarItem.home) {
      //         return HomeScreen();
      //       } else if (state.navbarItem == NavbarItem.explore) {
      //         return MyExploreScreen();
      //       } else if (state.navbarItem == NavbarItem.newItem) {
      //         return NewPostScreen();
      //       } else if (state.navbarItem == NavbarItem.myLibrary) {
      //         return MyLibraryScreen();
      //       } else if (state.navbarItem == NavbarItem.search) {
      //         return SearchScreen();
      //       }
      //       return Container();
      //     },
      //   ),
      // );
       AutoTabsScaffold(
        routes: [
          FeedScreenRoute(),
          ExploreScreenRoute(),
          NewPostScreenRoute(),
          MyLibraryScreenRoute(),
          ProfileScreenRoute(user: user)
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
        // appBarBuilder: AppBar(
        //   elevation: 0,
        //   titleSpacing: 1,
        //   leading: Icon(Icons.pause_circle),
        //   title: const Text(
        //     'Upcarta',
        //     style: kAppBarTextStyle,
        //   ),
        //   actions: [
        //     profileButton(),
        //   ],
        // ),
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
