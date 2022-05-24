// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:upcarta_mobile_app/app/app.dart' as _i2;
import 'package:upcarta_mobile_app/util/view_paths.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    EditProfileRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EditProfileScreen());
    },
    SettingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Settings());
    },
    NotificationSettingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.NotificationSettings());
    },
    SeeAllCollectionsAndAsksRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.SeeAllCollectionsAndAsksView());
    },
    SeeAllContentArchiveRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAllContentArchiveView());
    },
    SeeAll_RecentAsksRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAllRecentAsks());
    },
    SeeAll_PopularTopicsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAllPopularTopics());
    },
    SeeAll_InspiringPeopleRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAllInspiringPeople());
    },
    SeeAllFeaturedCollectionsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAllFeaturedCollections());
    },
    EntryPointRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EntryPoint());
    },
    InitialScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InitialScreen());
    },
    SplashScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    LoginScreen2Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen2());
    },
    ResetPasswordRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ResetPasswordView());
    },
    ResetPasswordNewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ResetPasswordNew());
    },
    MyRegisterRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MyRegister());
    },
    MyRegisterConfirmRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ConfirmRegisterView());
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    },
    HomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    CollectionsAndAsks_RecentRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.CollectionsAndAsksRecentView());
    },
    CollectionsAndAsks_PopularRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.CollectionsAndAsksPopularView());
    },
    ContentArchive_MostRecommendedRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.ContentArchiveMostRecommendedView());
    },
    ContentArchive_RecentRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ContentArchiveRecent());
    },
    RecentAsks_RecentRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.RecentAsksRecent());
    },
    RecentAsks_PopularRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.RecentAsksPopular());
    },
    InspiringPeople_CreatorsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InspiringPeopleCreators());
    },
    InspiringPeople_CommunityRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InspiringPeopleCommunity());
    },
    FeaturedCollections_RecentlyFeaturedRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.FeaturedCollectionsRecentlyFeatured());
    },
    FeaturedCollections_PopularRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.FeaturedCollectionsPopular());
    },
    UserOnboarding1Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UserOnboarding1());
    },
    UserOnboarding2Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UserOnboarding2());
    },
    UserOnboarding3Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UserOnboarding3());
    },
    UserOnboarding4Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UserOnboarding4());
    },
    FeedScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.FeedScreen());
    },
    ExploreScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ExploreScreen());
    },
    NewPostScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.NewPostScreen());
    },
    MyLibraryScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MyLibraryScreen());
    },
    ProfileScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ProfileScreen());
    },
    LatestScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LatestView());
    },
    TopScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.TopView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/entry', fullMatch: true),
        _i3.RouteConfig(LandingRoute.name, path: 'landing'),
        _i3.RouteConfig(EditProfileRoute.name, path: 'edit_profile'),
        _i3.RouteConfig(SettingsRoute.name, path: 'settings'),
        _i3.RouteConfig(NotificationSettingsRoute.name,
            path: 'notification_settings'),
        _i3.RouteConfig(SeeAllCollectionsAndAsksRoute.name,
            path: 'see_all_collections_and_asks',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAllCollectionsAndAsksRoute.name,
                  redirectTo: 'recent',
                  fullMatch: true),
              _i3.RouteConfig(CollectionsAndAsks_RecentRoute.name,
                  path: 'recent', parent: SeeAllCollectionsAndAsksRoute.name),
              _i3.RouteConfig(CollectionsAndAsks_PopularRoute.name,
                  path: 'popular', parent: SeeAllCollectionsAndAsksRoute.name)
            ]),
        _i3.RouteConfig(SeeAllContentArchiveRoute.name,
            path: 'see_all_content_archive',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAllContentArchiveRoute.name,
                  redirectTo: 'most_recommended',
                  fullMatch: true),
              _i3.RouteConfig(ContentArchive_MostRecommendedRoute.name,
                  path: 'most_recommended',
                  parent: SeeAllContentArchiveRoute.name),
              _i3.RouteConfig(ContentArchive_RecentRoute.name,
                  path: 'recent', parent: SeeAllContentArchiveRoute.name)
            ]),
        _i3.RouteConfig(SeeAll_RecentAsksRoute.name,
            path: 'see_all_recent_asks',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAll_RecentAsksRoute.name,
                  redirectTo: 'recent',
                  fullMatch: true),
              _i3.RouteConfig(RecentAsks_RecentRoute.name,
                  path: 'recent', parent: SeeAll_RecentAsksRoute.name),
              _i3.RouteConfig(RecentAsks_PopularRoute.name,
                  path: 'popular', parent: SeeAll_RecentAsksRoute.name)
            ]),
        _i3.RouteConfig(SeeAll_PopularTopicsRoute.name,
            path: 'see_all_popular_topics'),
        _i3.RouteConfig(SeeAll_InspiringPeopleRoute.name,
            path: 'see_all_inspiring_people',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAll_InspiringPeopleRoute.name,
                  redirectTo: 'creators',
                  fullMatch: true),
              _i3.RouteConfig(InspiringPeople_CreatorsRoute.name,
                  path: 'creators', parent: SeeAll_InspiringPeopleRoute.name),
              _i3.RouteConfig(InspiringPeople_CommunityRoute.name,
                  path: 'community', parent: SeeAll_InspiringPeopleRoute.name)
            ]),
        _i3.RouteConfig(SeeAllFeaturedCollectionsRoute.name,
            path: 'see_all_featured_collections',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAllFeaturedCollectionsRoute.name,
                  redirectTo: 'recently_featured',
                  fullMatch: true),
              _i3.RouteConfig(FeaturedCollections_RecentlyFeaturedRoute.name,
                  path: 'recently_featured',
                  parent: SeeAllFeaturedCollectionsRoute.name),
              _i3.RouteConfig(FeaturedCollections_PopularRoute.name,
                  path: 'popular', parent: SeeAllFeaturedCollectionsRoute.name)
            ]),
        _i3.RouteConfig(EntryPointRoute.name, path: '/entry'),
        _i3.RouteConfig(InitialScreenRoute.name, path: '/initial'),
        _i3.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i3.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i3.RouteConfig(LoginScreen2Route.name, path: '/login2'),
        _i3.RouteConfig(ResetPasswordRoute.name, path: '/forgot'),
        _i3.RouteConfig(ResetPasswordNewRoute.name, path: '/forgot_new'),
        _i3.RouteConfig(MyRegisterRoute.name, path: '/register'),
        _i3.RouteConfig(MyRegisterConfirmRoute.name, path: '/register_confirm'),
        _i3.RouteConfig(OnboardingScreenRoute.name,
            path: '/onboarding',
            children: [
              _i3.RouteConfig(UserOnboarding1Route.name,
                  path: '', parent: OnboardingScreenRoute.name),
              _i3.RouteConfig(UserOnboarding2Route.name,
                  path: 'userOnboarding2', parent: OnboardingScreenRoute.name),
              _i3.RouteConfig(UserOnboarding3Route.name,
                  path: 'userOnboarding3', parent: OnboardingScreenRoute.name),
              _i3.RouteConfig(UserOnboarding4Route.name,
                  path: 'userOnboarding4', parent: OnboardingScreenRoute.name),
              _i3.RouteConfig('*#redirect',
                  path: '*',
                  parent: OnboardingScreenRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i3.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i3.RouteConfig(FeedScreenRoute.name,
              path: 'feed',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig('#redirect',
                    path: '',
                    parent: FeedScreenRoute.name,
                    redirectTo: 'latest',
                    fullMatch: true),
                _i3.RouteConfig(LatestScreenRoute.name,
                    path: 'latest', parent: FeedScreenRoute.name),
                _i3.RouteConfig(TopScreenRoute.name,
                    path: 'top', parent: FeedScreenRoute.name)
              ]),
          _i3.RouteConfig(ExploreScreenRoute.name,
              path: 'explore', parent: HomeRoute.name),
          _i3.RouteConfig(NewPostScreenRoute.name,
              path: 'new', parent: HomeRoute.name),
          _i3.RouteConfig(MyLibraryScreenRoute.name,
              path: 'myLibrary', parent: HomeRoute.name),
          _i3.RouteConfig(ProfileScreenRoute.name,
              path: 'profile', parent: HomeRoute.name),
          _i3.RouteConfig('*#redirect',
              path: '*',
              parent: HomeRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i3.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: 'landing');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i1.EditProfileScreen]
class EditProfileRoute extends _i3.PageRouteInfo<void> {
  const EditProfileRoute() : super(EditProfileRoute.name, path: 'edit_profile');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i1.Settings]
class SettingsRoute extends _i3.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i1.NotificationSettings]
class NotificationSettingsRoute extends _i3.PageRouteInfo<void> {
  const NotificationSettingsRoute()
      : super(NotificationSettingsRoute.name, path: 'notification_settings');

  static const String name = 'NotificationSettingsRoute';
}

/// generated route for
/// [_i1.SeeAllCollectionsAndAsksView]
class SeeAllCollectionsAndAsksRoute extends _i3.PageRouteInfo<void> {
  const SeeAllCollectionsAndAsksRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllCollectionsAndAsksRoute.name,
            path: 'see_all_collections_and_asks', initialChildren: children);

  static const String name = 'SeeAll_CollectionsAndAsksRoute';
}

/// generated route for
/// [_i1.SeeAllContentArchiveView]
class SeeAllContentArchiveRoute extends _i3.PageRouteInfo<void> {
  const SeeAllContentArchiveRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllContentArchiveRoute.name,
            path: 'see_all_content_archive', initialChildren: children);

  static const String name = 'SeeAll_ContentArchiveRoute';
}

/// generated route for
/// [_i1.SeeAllRecentAsks]
class SeeAll_RecentAsksRoute extends _i3.PageRouteInfo<void> {
  const SeeAll_RecentAsksRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAll_RecentAsksRoute.name,
            path: 'see_all_recent_asks', initialChildren: children);

  static const String name = 'SeeAll_RecentAsksRoute';
}

/// generated route for
/// [_i1.SeeAllPopularTopics]
class SeeAll_PopularTopicsRoute extends _i3.PageRouteInfo<void> {
  const SeeAll_PopularTopicsRoute()
      : super(SeeAll_PopularTopicsRoute.name, path: 'see_all_popular_topics');

  static const String name = 'SeeAll_PopularTopicsRoute';
}

/// generated route for
/// [_i1.SeeAllInspiringPeople]
class SeeAll_InspiringPeopleRoute extends _i3.PageRouteInfo<void> {
  const SeeAll_InspiringPeopleRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAll_InspiringPeopleRoute.name,
            path: 'see_all_inspiring_people', initialChildren: children);

  static const String name = 'SeeAll_InspiringPeopleRoute';
}

/// generated route for
/// [_i1.SeeAllFeaturedCollections]
class SeeAllFeaturedCollectionsRoute extends _i3.PageRouteInfo<void> {
  const SeeAllFeaturedCollectionsRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllFeaturedCollectionsRoute.name,
            path: 'see_all_featured_collections', initialChildren: children);

  static const String name = 'SeeAll_FeaturedCollectionsRoute';
}

/// generated route for
/// [_i2.EntryPoint]
class EntryPointRoute extends _i3.PageRouteInfo<void> {
  const EntryPointRoute() : super(EntryPointRoute.name, path: '/entry');

  static const String name = 'EntryPointRoute';
}

/// generated route for
/// [_i1.InitialScreen]
class InitialScreenRoute extends _i3.PageRouteInfo<void> {
  const InitialScreenRoute() : super(InitialScreenRoute.name, path: '/initial');

  static const String name = 'InitialScreenRoute';
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i3.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i3.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i1.LoginScreen2]
class LoginScreen2Route extends _i3.PageRouteInfo<void> {
  const LoginScreen2Route() : super(LoginScreen2Route.name, path: '/login2');

  static const String name = 'LoginScreen2Route';
}

/// generated route for
/// [_i1.ResetPasswordView]
class ResetPasswordRoute extends _i3.PageRouteInfo<void> {
  const ResetPasswordRoute() : super(ResetPasswordRoute.name, path: '/forgot');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i1.ResetPasswordNew]
class ResetPasswordNewRoute extends _i3.PageRouteInfo<void> {
  const ResetPasswordNewRoute()
      : super(ResetPasswordNewRoute.name, path: '/forgot_new');

  static const String name = 'ResetPasswordNewRoute';
}

/// generated route for
/// [_i1.MyRegister]
class MyRegisterRoute extends _i3.PageRouteInfo<void> {
  const MyRegisterRoute() : super(MyRegisterRoute.name, path: '/register');

  static const String name = 'MyRegisterRoute';
}

/// generated route for
/// [_i1.ConfirmRegisterView]
class MyRegisterConfirmRoute extends _i3.PageRouteInfo<void> {
  const MyRegisterConfirmRoute()
      : super(MyRegisterConfirmRoute.name, path: '/register_confirm');

  static const String name = 'MyRegisterConfirmRoute';
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingScreenRoute extends _i3.PageRouteInfo<void> {
  const OnboardingScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(OnboardingScreenRoute.name,
            path: '/onboarding', initialChildren: children);

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i1.Home]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.CollectionsAndAsksRecentView]
class CollectionsAndAsks_RecentRoute extends _i3.PageRouteInfo<void> {
  const CollectionsAndAsks_RecentRoute()
      : super(CollectionsAndAsks_RecentRoute.name, path: 'recent');

  static const String name = 'CollectionsAndAsks_RecentRoute';
}

/// generated route for
/// [_i1.CollectionsAndAsksPopularView]
class CollectionsAndAsks_PopularRoute extends _i3.PageRouteInfo<void> {
  const CollectionsAndAsks_PopularRoute()
      : super(CollectionsAndAsks_PopularRoute.name, path: 'popular');

  static const String name = 'CollectionsAndAsks_PopularRoute';
}

/// generated route for
/// [_i1.ContentArchiveMostRecommendedView]
class ContentArchive_MostRecommendedRoute extends _i3.PageRouteInfo<void> {
  const ContentArchive_MostRecommendedRoute()
      : super(ContentArchive_MostRecommendedRoute.name,
            path: 'most_recommended');

  static const String name = 'ContentArchive_MostRecommendedRoute';
}

/// generated route for
/// [_i1.ContentArchiveRecent]
class ContentArchive_RecentRoute extends _i3.PageRouteInfo<void> {
  const ContentArchive_RecentRoute()
      : super(ContentArchive_RecentRoute.name, path: 'recent');

  static const String name = 'ContentArchive_RecentRoute';
}

/// generated route for
/// [_i1.RecentAsksRecent]
class RecentAsks_RecentRoute extends _i3.PageRouteInfo<void> {
  const RecentAsks_RecentRoute()
      : super(RecentAsks_RecentRoute.name, path: 'recent');

  static const String name = 'RecentAsks_RecentRoute';
}

/// generated route for
/// [_i1.RecentAsksPopular]
class RecentAsks_PopularRoute extends _i3.PageRouteInfo<void> {
  const RecentAsks_PopularRoute()
      : super(RecentAsks_PopularRoute.name, path: 'popular');

  static const String name = 'RecentAsks_PopularRoute';
}

/// generated route for
/// [_i1.InspiringPeopleCreators]
class InspiringPeople_CreatorsRoute extends _i3.PageRouteInfo<void> {
  const InspiringPeople_CreatorsRoute()
      : super(InspiringPeople_CreatorsRoute.name, path: 'creators');

  static const String name = 'InspiringPeople_CreatorsRoute';
}

/// generated route for
/// [_i1.InspiringPeopleCommunity]
class InspiringPeople_CommunityRoute extends _i3.PageRouteInfo<void> {
  const InspiringPeople_CommunityRoute()
      : super(InspiringPeople_CommunityRoute.name, path: 'community');

  static const String name = 'InspiringPeople_CommunityRoute';
}

/// generated route for
/// [_i1.FeaturedCollectionsRecentlyFeatured]
class FeaturedCollections_RecentlyFeaturedRoute
    extends _i3.PageRouteInfo<void> {
  const FeaturedCollections_RecentlyFeaturedRoute()
      : super(FeaturedCollections_RecentlyFeaturedRoute.name,
            path: 'recently_featured');

  static const String name = 'FeaturedCollections_RecentlyFeaturedRoute';
}

/// generated route for
/// [_i1.FeaturedCollectionsPopular]
class FeaturedCollections_PopularRoute extends _i3.PageRouteInfo<void> {
  const FeaturedCollections_PopularRoute()
      : super(FeaturedCollections_PopularRoute.name, path: 'popular');

  static const String name = 'FeaturedCollections_PopularRoute';
}

/// generated route for
/// [_i1.UserOnboarding1]
class UserOnboarding1Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding1Route() : super(UserOnboarding1Route.name, path: '');

  static const String name = 'UserOnboarding1Route';
}

/// generated route for
/// [_i1.UserOnboarding2]
class UserOnboarding2Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding2Route()
      : super(UserOnboarding2Route.name, path: 'userOnboarding2');

  static const String name = 'UserOnboarding2Route';
}

/// generated route for
/// [_i1.UserOnboarding3]
class UserOnboarding3Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding3Route()
      : super(UserOnboarding3Route.name, path: 'userOnboarding3');

  static const String name = 'UserOnboarding3Route';
}

/// generated route for
/// [_i1.UserOnboarding4]
class UserOnboarding4Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding4Route()
      : super(UserOnboarding4Route.name, path: 'userOnboarding4');

  static const String name = 'UserOnboarding4Route';
}

/// generated route for
/// [_i1.FeedScreen]
class FeedScreenRoute extends _i3.PageRouteInfo<void> {
  const FeedScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(FeedScreenRoute.name, path: 'feed', initialChildren: children);

  static const String name = 'FeedScreenRoute';
}

/// generated route for
/// [_i1.ExploreScreen]
class ExploreScreenRoute extends _i3.PageRouteInfo<void> {
  const ExploreScreenRoute() : super(ExploreScreenRoute.name, path: 'explore');

  static const String name = 'ExploreScreenRoute';
}

/// generated route for
/// [_i1.NewPostScreen]
class NewPostScreenRoute extends _i3.PageRouteInfo<void> {
  const NewPostScreenRoute() : super(NewPostScreenRoute.name, path: 'new');

  static const String name = 'NewPostScreenRoute';
}

/// generated route for
/// [_i1.MyLibraryScreen]
class MyLibraryScreenRoute extends _i3.PageRouteInfo<void> {
  const MyLibraryScreenRoute()
      : super(MyLibraryScreenRoute.name, path: 'myLibrary');

  static const String name = 'MyLibraryScreenRoute';
}

/// generated route for
/// [_i1.ProfileScreen]
class ProfileScreenRoute extends _i3.PageRouteInfo<void> {
  const ProfileScreenRoute() : super(ProfileScreenRoute.name, path: 'profile');

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i1.LatestView]
class LatestScreenRoute extends _i3.PageRouteInfo<void> {
  const LatestScreenRoute() : super(LatestScreenRoute.name, path: 'latest');

  static const String name = 'LatestScreenRoute';
}

/// generated route for
/// [_i1.TopView]
class TopScreenRoute extends _i3.PageRouteInfo<void> {
  const TopScreenRoute() : super(TopScreenRoute.name, path: 'top');

  static const String name = 'TopScreenRoute';
}
