// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:upcarta_mobile_app/ui/screens/screens.dart' as _i2;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_collections_and_asks/see_all_collections_and_asks.dart'
    as _i1;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_content_archive/sub_pages/content_archive_most_recommended.dart'
    as _i4;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_content_archive/sub_pages/content_archive_recent.dart'
    as _i5;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_featured_collections/see_all_featured_collections.dart'
    as _i3;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_featured_collections/sub_pages/featured_collections_popular.dart'
    as _i11;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_featured_collections/sub_pages/featured_collections_recently_featured.dart'
    as _i10;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_inspiring_people/sub_pages/inspiring_people_community.dart'
    as _i9;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_inspiring_people/sub_pages/inspiring_people_creators.dart'
    as _i8;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_recent_asks/sub_pages/recent_asks_popular.dart'
    as _i7;
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_recent_asks/sub_pages/recent_asks_recent.dart'
    as _i6;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SeeAll_CollectionsAndAsksRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAll_CollectionsAndAsks());
    },
    SeeAll_ContentArchiveRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SeeAll_ContentArchive());
    },
    SeeAll_RecentAsksRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SeeAll_RecentAsks());
    },
    SeeAll_PopularTopicsRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SeeAll_PopularTopics());
    },
    SeeAll_InspiringPeopleRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SeeAll_InspiringPeople());
    },
    SeeAll_FeaturedCollectionsRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SeeAll_FeaturedCollections());
    },
    SplashScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    LoginScreen2Route.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen2());
    },
    ResetPasswordRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.resetPassword());
    },
    ResetPasswordNewRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.resetPasswordNew());
    },
    MyRegisterRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MyRegister());
    },
    MyRegisterConfirmRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.myRegisterConfirm());
    },
    LandingPageRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    NotificationsScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.NotificationsScreen());
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    HomeRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.Home());
    },
    CollectionsAndAsks_RecentRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.CollectionsAndAsks_Recent());
    },
    CollectionsAndAsks_PopularRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.CollectionsAndAsks_Popular());
    },
    ContentArchive_MostRecommendedRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i4.ContentArchive_MostRecommended());
    },
    ContentArchive_RecentRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.ContentArchive_Recent());
    },
    RecentAsks_RecentRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.RecentAsks_Recent());
    },
    RecentAsks_PopularRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.RecentAsks_Popular());
    },
    InspiringPeople_CreatorsRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.InspiringPeople_Creators());
    },
    InspiringPeople_CommunityRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.InspiringPeople_Community());
    },
    FeaturedCollections_RecentlyFeaturedRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i10.FeaturedCollections_RecentlyFeatured());
    },
    FeaturedCollections_PopularRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i11.FeaturedCollections_Popular());
    },
    UserOnboarding1Route.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UserOnboarding1());
    },
    UserOnboarding2Route.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UserOnboarding2());
    },
    UserOnboarding3Route.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UserOnboarding3());
    },
    UserOnboarding4Route.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UserOnboarding4());
    },
    FeedScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.FeedScreen());
    },
    ExploreScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ExploreScreen());
    },
    NewPostScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.NewPostScreen());
    },
    MyLibraryScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MyLibraryScreen());
    },
    ProfileScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ProfileScreen());
    },
    LatestScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LatestView());
    },
    TopScreenRoute.name: (routeData) {

      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.TopView());
    },
    EditProfileRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EditProfileScreen());
    },
    SettingsRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Settings());
    },

    NotificationSettingsRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.NotificationSettings());
    }
  };

  @override

  List<_i2.RouteConfig> get routes => [
    _i2.RouteConfig('/#redirect',
        path: '/', redirectTo: '/splash', fullMatch: true),
    _i2.RouteConfig(SplashScreenRoute.name, path: '/splash'),
    _i2.RouteConfig(LoginScreenRoute.name, path: '/login'),
    _i2.RouteConfig(LoginScreen2Route.name, path: '/login2'),
    _i2.RouteConfig(ResetPasswordRoute.name, path: '/forgot'),
    _i2.RouteConfig(ResetPasswordNewRoute.name, path: '/forgot_new'),
    _i2.RouteConfig(MyRegisterRoute.name, path: '/register'),
    _i2.RouteConfig(MyRegisterConfirmRoute.name, path: '/register_confirm'),
    _i2.RouteConfig(LandingPageRoute.name, path: '/landing_page'),
    _i2.RouteConfig(NotificationsScreenRoute.name, path: '/notifications'),
    _i2.RouteConfig(EditProfileRoute.name, path: '/edit_profile'),
    _i2.RouteConfig(SettingsRoute.name, path: '/settings'),
    _i2.RouteConfig(NotificationSettingsRoute.name, path: '/notification_settings'),
    _i2.RouteConfig(OnboardingScreenRoute.name,
        path: '/onboarding',
        children: [
          _i2.RouteConfig(UserOnboarding1Route.name,
              path: '', parent: OnboardingScreenRoute.name),
          _i2.RouteConfig(UserOnboarding2Route.name,
              path: 'userOnboarding2', parent: OnboardingScreenRoute.name),
          _i2.RouteConfig(UserOnboarding3Route.name,
              path: 'userOnboarding3', parent: OnboardingScreenRoute.name),
          _i2.RouteConfig(UserOnboarding4Route.name,
              path: 'userOnboarding4', parent: OnboardingScreenRoute.name),
          _i2.RouteConfig('*#redirect',
              path: '*',
              parent: OnboardingScreenRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),

    _i2.RouteConfig(HomeRoute.name, path: '/home', children: [
      _i2.RouteConfig(FeedScreenRoute.name,
          path: 'feed',
          parent: HomeRoute.name,
          children: [
            _i2.RouteConfig('#redirect',
                path: '',
                parent: FeedScreenRoute.name,
                redirectTo: 'latest',
                fullMatch: true),
            _i2.RouteConfig(LatestScreenRoute.name,
                path: 'latest', parent: FeedScreenRoute.name),
            _i2.RouteConfig(TopScreenRoute.name,
                path: 'top', parent: FeedScreenRoute.name)
          ]),
      _i2.RouteConfig(ExploreScreenRoute.name,
          path: 'explore', parent: HomeRoute.name),
      _i2.RouteConfig(NewPostScreenRoute.name,
          path: 'new', parent: HomeRoute.name),
      _i2.RouteConfig(MyLibraryScreenRoute.name,
          path: 'myLibrary', parent: HomeRoute.name),
      _i2.RouteConfig(ProfileScreenRoute.name,
          path: 'profile', parent: HomeRoute.name),
      _i2.RouteConfig('*#redirect',
          path: '*',
          parent: HomeRoute.name,
          redirectTo: '',
          fullMatch: true)
    ]),
    _i2.RouteConfig('*#redirect',
        path: '*', redirectTo: '', fullMatch: true)
  ];
}

/// generated route for
/// [_i1.SeeAll_CollectionsAndAsks]
class SeeAll_CollectionsAndAsksRoute extends _i12.PageRouteInfo<void> {
  const SeeAll_CollectionsAndAsksRoute({List<_i12.PageRouteInfo>? children})
      : super(SeeAll_CollectionsAndAsksRoute.name,
            path: 'see_all_collections_and_asks', initialChildren: children);

  static const String name = 'SeeAll_CollectionsAndAsksRoute';
}

/// generated route for
/// [_i2.SeeAll_ContentArchive]
class SeeAll_ContentArchiveRoute extends _i12.PageRouteInfo<void> {
  const SeeAll_ContentArchiveRoute({List<_i12.PageRouteInfo>? children})
      : super(SeeAll_ContentArchiveRoute.name,
            path: 'see_all_content_archive', initialChildren: children);

  static const String name = 'SeeAll_ContentArchiveRoute';
}

/// generated route for
/// [_i2.SeeAll_RecentAsks]
class SeeAll_RecentAsksRoute extends _i12.PageRouteInfo<void> {
  const SeeAll_RecentAsksRoute({List<_i12.PageRouteInfo>? children})
      : super(SeeAll_RecentAsksRoute.name,
            path: 'see_all_recent_asks', initialChildren: children);

  static const String name = 'SeeAll_RecentAsksRoute';
}

/// generated route for
/// [_i2.SeeAll_PopularTopics]
class SeeAll_PopularTopicsRoute extends _i12.PageRouteInfo<void> {
  const SeeAll_PopularTopicsRoute()
      : super(SeeAll_PopularTopicsRoute.name, path: 'see_all_popular_topics');

  static const String name = 'SeeAll_PopularTopicsRoute';
}

/// generated route for
/// [_i2.SeeAll_InspiringPeople]
class SeeAll_InspiringPeopleRoute extends _i12.PageRouteInfo<void> {
  const SeeAll_InspiringPeopleRoute({List<_i12.PageRouteInfo>? children})
      : super(SeeAll_InspiringPeopleRoute.name,
            path: 'see_all_inspiring_people', initialChildren: children);

  static const String name = 'SeeAll_InspiringPeopleRoute';
}

/// generated route for
/// [_i3.SeeAll_FeaturedCollections]
class SeeAll_FeaturedCollectionsRoute extends _i12.PageRouteInfo<void> {
  const SeeAll_FeaturedCollectionsRoute({List<_i12.PageRouteInfo>? children})
      : super(SeeAll_FeaturedCollectionsRoute.name,
            path: 'see_all_featured_collections', initialChildren: children);

  static const String name = 'SeeAll_FeaturedCollectionsRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreenRoute extends _i12.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i12.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen2]
class LoginScreen2Route extends _i12.PageRouteInfo<void> {
  const LoginScreen2Route() : super(LoginScreen2Route.name, path: '/login2');

  static const String name = 'LoginScreen2Route';
}

/// generated route for
/// [_i2.resetPassword]
class ResetPasswordRoute extends _i12.PageRouteInfo<void> {
  const ResetPasswordRoute() : super(ResetPasswordRoute.name, path: '/forgot');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i2.resetPasswordNew]
class ResetPasswordNewRoute extends _i12.PageRouteInfo<void> {
  const ResetPasswordNewRoute()
      : super(ResetPasswordNewRoute.name, path: '/forgot_new');

  static const String name = 'ResetPasswordNewRoute';
}

/// generated route for
/// [_i2.MyRegister]
class MyRegisterRoute extends _i12.PageRouteInfo<void> {
  const MyRegisterRoute() : super(MyRegisterRoute.name, path: '/register');

  static const String name = 'MyRegisterRoute';
}

/// generated route for
/// [_i2.myRegisterConfirm]
class MyRegisterConfirmRoute extends _i12.PageRouteInfo<void> {
  const MyRegisterConfirmRoute()
      : super(MyRegisterConfirmRoute.name, path: '/register_confirm');

  static const String name = 'MyRegisterConfirmRoute';
}

/// generated route for

/// [_i1.LandingPage]
class LandingPageRoute extends _i2.PageRouteInfo<void> {
  const LandingPageRoute()
      : super(LandingPageRoute.name, path: '/landing_page');

  static const String name = 'LandingPageRoute';
}

/// generated route for
/// [_i1.NotificationsScreen]
class NotificationsScreenRoute extends _i2.PageRouteInfo<void> {
  const NotificationsScreenRoute()
      : super(NotificationsScreenRoute.name, path: '/notifications');

  static const String name = 'NotificationsScreenRoute';
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingScreenRoute extends _i2.PageRouteInfo<void> {
  const OnboardingScreenRoute({List<_i2.PageRouteInfo>? children})
      : super(OnboardingScreenRoute.name,
      path: '/onboarding', initialChildren: children);

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i2.Home]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CollectionsAndAsks_Recent]
class CollectionsAndAsks_RecentRoute extends _i12.PageRouteInfo<void> {
  const CollectionsAndAsks_RecentRoute()
      : super(CollectionsAndAsks_RecentRoute.name, path: 'recent');

  static const String name = 'CollectionsAndAsks_RecentRoute';
}

/// generated route for
/// [_i2.CollectionsAndAsks_Popular]
class CollectionsAndAsks_PopularRoute extends _i12.PageRouteInfo<void> {
  const CollectionsAndAsks_PopularRoute()
      : super(CollectionsAndAsks_PopularRoute.name, path: 'popular');

  static const String name = 'CollectionsAndAsks_PopularRoute';
}

/// generated route for
/// [_i4.ContentArchive_MostRecommended]
class ContentArchive_MostRecommendedRoute extends _i12.PageRouteInfo<void> {
  const ContentArchive_MostRecommendedRoute()
      : super(ContentArchive_MostRecommendedRoute.name,
            path: 'most_recommended');

  static const String name = 'ContentArchive_MostRecommendedRoute';
}

/// generated route for
/// [_i5.ContentArchive_Recent]
class ContentArchive_RecentRoute extends _i12.PageRouteInfo<void> {
  const ContentArchive_RecentRoute()
      : super(ContentArchive_RecentRoute.name, path: 'recent');

  static const String name = 'ContentArchive_RecentRoute';
}

/// generated route for
/// [_i6.RecentAsks_Recent]
class RecentAsks_RecentRoute extends _i12.PageRouteInfo<void> {
  const RecentAsks_RecentRoute()
      : super(RecentAsks_RecentRoute.name, path: 'recent');

  static const String name = 'RecentAsks_RecentRoute';
}

/// generated route for
/// [_i7.RecentAsks_Popular]
class RecentAsks_PopularRoute extends _i12.PageRouteInfo<void> {
  const RecentAsks_PopularRoute()
      : super(RecentAsks_PopularRoute.name, path: 'popular');

  static const String name = 'RecentAsks_PopularRoute';
}

/// generated route for
/// [_i8.InspiringPeople_Creators]
class InspiringPeople_CreatorsRoute extends _i12.PageRouteInfo<void> {
  const InspiringPeople_CreatorsRoute()
      : super(InspiringPeople_CreatorsRoute.name, path: 'creators');

  static const String name = 'InspiringPeople_CreatorsRoute';
}

/// generated route for
/// [_i9.InspiringPeople_Community]
class InspiringPeople_CommunityRoute extends _i12.PageRouteInfo<void> {
  const InspiringPeople_CommunityRoute()
      : super(InspiringPeople_CommunityRoute.name, path: 'community');

  static const String name = 'InspiringPeople_CommunityRoute';
}

/// generated route for
/// [_i10.FeaturedCollections_RecentlyFeatured]
class FeaturedCollections_RecentlyFeaturedRoute
    extends _i12.PageRouteInfo<void> {
  const FeaturedCollections_RecentlyFeaturedRoute()
      : super(FeaturedCollections_RecentlyFeaturedRoute.name,
            path: 'recently_featured');

  static const String name = 'FeaturedCollections_RecentlyFeaturedRoute';
}

/// generated route for
/// [_i11.FeaturedCollections_Popular]
class FeaturedCollections_PopularRoute extends _i12.PageRouteInfo<void> {
  const FeaturedCollections_PopularRoute()
      : super(FeaturedCollections_PopularRoute.name, path: 'popular');

  static const String name = 'FeaturedCollections_PopularRoute';
}

/// generated route for
/// [_i2.UserOnboarding1]
class UserOnboarding1Route extends _i12.PageRouteInfo<void> {
  const UserOnboarding1Route() : super(UserOnboarding1Route.name, path: '');

  static const String name = 'UserOnboarding1Route';
}

/// generated route for
/// [_i2.UserOnboarding2]
class UserOnboarding2Route extends _i12.PageRouteInfo<void> {
  const UserOnboarding2Route()
      : super(UserOnboarding2Route.name, path: 'userOnboarding2');

  static const String name = 'UserOnboarding2Route';
}

/// generated route for
/// [_i2.UserOnboarding3]
class UserOnboarding3Route extends _i12.PageRouteInfo<void> {
  const UserOnboarding3Route()
      : super(UserOnboarding3Route.name, path: 'userOnboarding3');

  static const String name = 'UserOnboarding3Route';
}

/// generated route for
/// [_i2.UserOnboarding4]
class UserOnboarding4Route extends _i12.PageRouteInfo<void> {
  const UserOnboarding4Route()
      : super(UserOnboarding4Route.name, path: 'userOnboarding4');

  static const String name = 'UserOnboarding4Route';
}

/// generated route for
/// [_i2.FeedScreen]
class FeedScreenRoute extends _i12.PageRouteInfo<void> {
  const FeedScreenRoute({List<_i12.PageRouteInfo>? children})
      : super(FeedScreenRoute.name, path: 'feed', initialChildren: children);

  static const String name = 'FeedScreenRoute';
}

/// generated route for
/// [_i2.ExploreScreen]
class ExploreScreenRoute extends _i12.PageRouteInfo<void> {
  const ExploreScreenRoute() : super(ExploreScreenRoute.name, path: 'explore');

  static const String name = 'ExploreScreenRoute';
}

/// generated route for
/// [_i2.NewPostScreen]
class NewPostScreenRoute extends _i12.PageRouteInfo<void> {
  const NewPostScreenRoute() : super(NewPostScreenRoute.name, path: 'new');

  static const String name = 'NewPostScreenRoute';
}

/// generated route for
/// [_i2.MyLibraryScreen]
class MyLibraryScreenRoute extends _i12.PageRouteInfo<void> {
  const MyLibraryScreenRoute()
      : super(MyLibraryScreenRoute.name, path: 'myLibrary');

  static const String name = 'MyLibraryScreenRoute';
}

/// generated route for
/// [_i2.ProfileScreen]
class ProfileScreenRoute extends _i12.PageRouteInfo<void> {
  const ProfileScreenRoute() : super(ProfileScreenRoute.name, path: 'profile');

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i2.LatestView]
class LatestScreenRoute extends _i12.PageRouteInfo<void> {
  const LatestScreenRoute() : super(LatestScreenRoute.name, path: 'latest');

  static const String name = 'LatestScreenRoute';
}

/// generated route for
/// [_i2.TopView]
class TopScreenRoute extends _i12.PageRouteInfo<void> {
  const TopScreenRoute() : super(TopScreenRoute.name, path: 'top');

  static const String name = 'TopScreenRoute';
}

/// [_i1.EditProfileScreen]
class EditProfileRoute extends _i2.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(EditProfileRoute.name, path: '/edit_profile');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i1.Settings]
class SettingsRoute extends _i2.PageRouteInfo<void> {
  const SettingsRoute()
      : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i1.NotificationSettings]
class NotificationSettingsRoute extends _i2.PageRouteInfo<void> {
  const NotificationSettingsRoute() : super(NotificationSettingsRoute.name, path: 'notification_settings');

  static const String name = 'NotificationSettingsRoute';
}