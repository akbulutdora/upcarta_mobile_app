import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';
import '../app/app.dart';

@AdaptiveAutoRouter(
    replaceInRouteName: 'Page,Route,Screen',
    routes: <AutoRoute>[
      AutoRoute(
        path: 'landing',
        name: "LandingRoute",
        page: LandingPage,
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
      ),
      AutoRoute(
        path: 'notification_settings',
        name: 'NotificationSettingsRoute',
        page: NotificationSettings,
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
          path: 'see_all_content_archive',
          page: SeeAllContentArchiveView,
          children: [
            AutoRoute(
              path: 'most_recommended',
              initial: true,
              page: ContentArchiveMostRecommendedView,
            ),
            AutoRoute(
              path: 'recent',
              page: ContentArchiveRecent,
            ),
          ]),
      AutoRoute(path: 'see_all_recent_asks', page: SeeAllRecentAsks, children: [
        AutoRoute(
          path: 'recent',
          initial: true,
          page: RecentAsksRecent,
        ),
        AutoRoute(
          path: 'popular',
          page: RecentAsksPopular,
        ),
      ]),
      AutoRoute(
        path: 'see_all_popular_topics',
        page: SeeAllPopularTopics,
      ),
      AutoRoute(
          path: 'see_all_inspiring_people',
          page: SeeAllInspiringPeople,
          children: [
            AutoRoute(
              path: 'creators',
              initial: true,
              page: InspiringPeopleCreators,
            ),
            AutoRoute(
              path: 'community',
              page: InspiringPeopleCommunity,
            ),
          ]),
      AutoRoute(
          path: 'see_all_featured_collections',
          page: SeeAllFeaturedCollections,
          children: [
            AutoRoute(
              path: 'recently_featured',
              initial: true,
              page: FeaturedCollectionsRecentlyFeatured,
            ),
            AutoRoute(
              path: 'popular',
              page: FeaturedCollectionsPopular,
            ),
          ]),
      AutoRoute(
        initial: true,
        path: '/entry',
        page: EntryPoint,
      ),
      AutoRoute(
        path: '/initial',
        page: InitialScreen,
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
