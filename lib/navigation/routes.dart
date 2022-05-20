import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_collections_and_asks/see_all_collections_and_asks.dart';
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_content_archive/sub_pages/content_archive_recent.dart';
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_featured_collections/sub_pages/featured_collections_popular.dart';
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_featured_collections/sub_pages/featured_collections_recently_featured.dart';
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_inspiring_people/sub_pages/inspiring_people_community.dart';
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_inspiring_people/sub_pages/inspiring_people_creators.dart';
import '../ui/screens/see_all_horizontal_content_list/see_all_content_archive/sub_pages/content_archive_most_recommended.dart';
import '../ui/screens/see_all_horizontal_content_list/see_all_featured_collections/see_all_featured_collections.dart';
import '../ui/screens/see_all_horizontal_content_list/see_all_recent_asks/sub_pages/recent_asks_popular.dart';
import '../ui/screens/see_all_horizontal_content_list/see_all_recent_asks/sub_pages/recent_asks_recent.dart';

@AdaptiveAutoRouter(
    replaceInRouteName: 'Page,Route,Screen',
    routes: <AutoRoute>[
      AutoRoute(
          path: 'see_all_collections_and_asks',
          page: SeeAll_CollectionsAndAsks,
          children: [
            AutoRoute(
              path: 'recent',
              initial: true,
              page: CollectionsAndAsks_Recent,
            ),
            AutoRoute(
              path: 'popular',
              page: CollectionsAndAsks_Popular,
            ),
          ]),
      AutoRoute(
          path: 'see_all_content_archive',
          page: SeeAll_ContentArchive,
          children: [
            AutoRoute(
              path: 'most_recommended',
              initial: true,
              page: ContentArchive_MostRecommended,
            ),
            AutoRoute(
              path: 'recent',
              page: ContentArchive_Recent,
            ),
          ]),
      AutoRoute(
          path: 'see_all_recent_asks',
          page: SeeAll_RecentAsks,
          children: [
            AutoRoute(
              path: 'recent',
              initial: true,
              page: RecentAsks_Recent,
            ),
            AutoRoute(
              path: 'popular',
              page: RecentAsks_Popular,
            ),
          ]),
      AutoRoute(
        path: 'see_all_popular_topics',
        page: SeeAll_PopularTopics,
      ),
      AutoRoute(
          path: 'see_all_inspiring_people',
          page: SeeAll_InspiringPeople,
          children: [
            AutoRoute(
              path: 'creators',
              initial: true,
              page: InspiringPeople_Creators,
            ),
            AutoRoute(
              path: 'community',
              page: InspiringPeople_Community,
            ),
          ]),
      AutoRoute(
          path: 'see_all_featured_collections',
          page: SeeAll_FeaturedCollections,
          children: [
            AutoRoute(
              path: 'recently_featured',
              initial: true,
              page: FeaturedCollections_RecentlyFeatured,
            ),
            AutoRoute(
              path: 'popular',
              page: FeaturedCollections_Popular,
            ),
          ]),
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
    RedirectRoute(path: '*', redirectTo: ''),
  ],
);
