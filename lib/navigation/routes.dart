import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';
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
        path: 'landing',
        name: 'LandingRoute',
        page: LandingPage,
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
        page: ResetPasswordView,
      ),
      AutoRoute(
        path: '/forgot_new',
        page: ResetPasswordNew,
      ),
      AutoRoute(
        path: '/register',
        page: MyRegister,
      ),
      AutoRoute(
        path: '/register_confirm',
        page: ConfirmRegisterView,
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
            path: 'my_profile',
            name: 'ProfileScreenRoute',
            page: MyProfileScreen,
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: 'edit_profile',
        name: 'EditProfileRoute',
        page: EditProfileScreen,
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRoute',
        page: Settings,
      ),
      AutoRoute(
        path: 'notification_settings',
        name: 'NotificationSettingsRoute',
        page: NotificationSettings,
      ),
      AutoRoute(
        path: 'notification_screen',
        name: 'NotificationsScreenRoute',
        page: NotificationsScreen,
      ),
      AutoRoute(
        path: 'email_settings',
        name: 'EmailSettingsRoute',
        page: EmailSettings,
      ),
      AutoRoute(
        path: 'password_settings',
        name: 'PasswordSettingsRoute',
        page: PasswordSettings,
      ),
      AutoRoute(
          path: 'see_all_collections_and_asks',
          page: SeeAllCollectionsAndAsksView,
          children: [
            AutoRoute(
              path: 'recent',
              initial: true,
              page: CollectionsAndAsksRecentView,
            ),
            AutoRoute(
              path: 'popular',
              page: CollectionsAndAsksPopularView,
            ),
          ]),
      AutoRoute(
        path: '/other_profile',
        page: OtherProfileScreen,
      ),
      AutoRoute(
        path: '/onboarding',
        page: OnboardingScreen,
        children: [
          AutoRoute(
            path: '',
            name: 'EditOnboardingRoute',
            page: EditOnboarding,
          ),
          AutoRoute(
            path: 'userOnboarding1',
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
      RedirectRoute(path: '*', redirectTo: ''),
    ])
class $AppRouter {}
