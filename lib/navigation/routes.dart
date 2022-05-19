import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/main.dart';

import 'package:upcarta_mobile_app/ui/screens/screens.dart';

import '../app/app.dart';

@AdaptiveAutoRouter(
    replaceInRouteName: 'Page,Route,Screen',
    routes: <AutoRoute>[
      AutoRoute(
        initial: true,
        path: '/entry',
        page: EntryPoint,
      ),
      AutoRoute(
        path: '/splash',
        page: SplashScreen,
      ),
      AutoRoute(
        path: '/login',
        page: LoginScreen,
      ),
      AutoRoute(
        path: '/login2',
        page: LoginScreen2,
      ),
      AutoRoute(
        path: '/forgot',
        page: resetPassword,
      ),
      AutoRoute(
        path: '/forgot_new',
        page: resetPasswordNew,
      ),
      AutoRoute(
        path: '/register',
        page: MyRegister,
      ),
      AutoRoute(
        path: '/register_confirm',
        page: myRegisterConfirm,
      ),
      AutoRoute(
        path: '/onboarding',
        page: OnboardingScreen,
        children: [
          AutoRoute(
            path: '',
            name: 'UserOnboarding1Route',
            page: UserOnboarding1,
          ),
          AutoRoute(
            path: 'userOnboarding2',
            name: 'UserOnboarding2Route',
            page: UserOnboarding2,
          ),
          AutoRoute(
            path: 'userOnboarding3',
            name: 'UserOnboarding3Route',
            page: UserOnboarding3,
          ),
          AutoRoute(
            path: 'userOnboarding4',
            name: 'UserOnboarding4Route',
            page: UserOnboarding4,
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: '/home',
        page: Home,
        initial: false,
        children: [
          AutoRoute(
            path: 'feed',
            name: 'FeedScreenRoute',
            page: FeedScreen,
            children: [
              AutoRoute(
                path: 'latest',
                initial: true,
                name: 'LatestScreenRoute',
                page: LatestView,
              ),
              AutoRoute(
                path: 'top',
                name: 'TopScreenRoute',
                page: TopView,
              ),
            ],
          ),
          AutoRoute(
            path: 'explore',
            name: 'ExploreScreenRoute',
            page: ExploreScreen,
          ),
          AutoRoute(
            path: 'new',
            name: 'NewPostScreenRoute',
            page: NewPostScreen,
          ),
          AutoRoute(
            path: 'myLibrary',
            name: 'MyLibraryScreenRoute',
            page: MyLibraryScreen,
          ),
          AutoRoute(
            path: 'profile',
            name: 'ProfileScreenRoute',
            page: ProfileScreen,
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ])
class $AppRouter {}
