import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/ui/screens/edit_profile.dart';
import 'package:upcarta_mobile_app/ui/screens/notification_settings.dart';

import 'package:upcarta_mobile_app/ui/screens/screens.dart';

import '../ui/screens/settings.dart';

@AdaptiveAutoRouter(
    replaceInRouteName: 'Page,Route,Screen',
    routes: <AutoRoute>[
      AutoRoute(
        initial: true,
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
        page: myRegister,
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
      groupTabRouter,
      // AutoRoute(
      //   path: '/',
      //   page: Home,
      //   children: [
      //     AutoRoute(path: '/feed', page: FeedScreen),
      //     AutoRoute(path: '/explore', page: ExploreScreen),
      //     AutoRoute(path: '/myLibrary', page: MyLibraryScreen),
      //     AutoRoute(path: '/my', page: NewPostScreen),
      //     AutoRoute(path: '/profile', page: ProfileScreen),
      //     groupTabRouter,
      //     // redirect all other paths
      //     RedirectRoute(path: '*', redirectTo: 'profile'),
      //   ],
      // ),
      RedirectRoute(path: '*', redirectTo: ''),
    ])
class $AppRouter {}

const groupTabRouter = AutoRoute(
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
    AutoRoute(
      path: 'edit_profile',
      name: "EditProfileRoute",
      page: EditProfileScreen,
    ),
    AutoRoute(
      path: 'settings',
      name: "SettingsRoute",
      page: Settings,
      children: [
        AutoRoute(
          path: 'notification_settings',
          name: 'NotificationSettingsRoute',
          page: NotificationSettings,
        ),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: ''),
  ],
);
