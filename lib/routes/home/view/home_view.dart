import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/query_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';
import 'package:upcarta_mobile_app/routes/other_profile/bloc/other_profile_bloc.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return const MaterialPage(
      child: Home(),
    );
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Home());
  }

  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: false,
            create: (_) => UserBloc(
                userRepository: context.read<UserRepository>(),
                authRepository: context.read<AuthenticationRepository>())),
        // BlocProvider(
        //     create: ((_) => OtherProfileBloc(
        //         queryRepository: context.read<QueryRepository>())))
      ],
      child: AutoTabsScaffold(
        routes: const [
          FeedScreenRoute(),
          ExploreScreenRoute(),
          NewPostScreenRoute(),
          MyLibraryScreenRoute(),
          ProfileScreenRoute()
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            type: BottomNavigationBarType.fixed,
            iconSize: 26.sm,
            selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
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
      ),
    );
  }
}