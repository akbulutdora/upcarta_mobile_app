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
    NotificationsScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.NotificationsScreen());
    },
    EmailSettingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EmailSettings());
    },
    PasswordSettingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.PasswordSettings());
    },
    SeeAllCollectionsAndAsksViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.SeeAllCollectionsAndAsksView());
    },
    SeeAllContentArchiveViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAllContentArchiveView());
    },
    SeeAllRecentAsksRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAllRecentAsks());
    },
    SeeAllPopularTopicsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SeeAllPopularTopics());
    },
    SeeAllInspiringPeopleRoute.name: (routeData) {
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
    OtherProfileScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.OtherProfileScreen());
    },
    ResetPasswordViewRoute.name: (routeData) {
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
    ConfirmRegisterViewRoute.name: (routeData) {
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
    CollectionsAndAsksRecentViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.CollectionsAndAsksRecentView());
    },
    CollectionsAndAsksPopularViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.CollectionsAndAsksPopularView());
    },
    ContentArchiveMostRecommendedViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.ContentArchiveMostRecommendedView());
    },
    ContentArchiveRecentRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ContentArchiveRecent());
    },
    RecentAsksRecentRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.RecentAsksRecent());
    },
    RecentAsksPopularRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.RecentAsksPopular());
    },
    InspiringPeopleCreatorsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InspiringPeopleCreators());
    },
    InspiringPeopleCommunityRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InspiringPeopleCommunity());
    },
    FeaturedCollectionsRecentlyFeaturedRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.FeaturedCollectionsRecentlyFeatured());
    },
    FeaturedCollectionsPopularRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.FeaturedCollectionsPopular());
    },
    EditOnboardingRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EditOnboarding());
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
          routeData: routeData, child: const _i1.FeedScreen());
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
          routeData: routeData, child: const _i1.MyProfileScreen());
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
        _i3.RouteConfig(NotificationsScreenRoute.name,
            path: 'notification_screen'),
        _i3.RouteConfig(EmailSettingsRoute.name, path: 'email_settings'),
        _i3.RouteConfig(PasswordSettingsRoute.name, path: 'password_settings'),
        _i3.RouteConfig(SeeAllCollectionsAndAsksViewRoute.name,
            path: 'see_all_collections_and_asks',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAllCollectionsAndAsksViewRoute.name,
                  redirectTo: 'recent',
                  fullMatch: true),
              _i3.RouteConfig(CollectionsAndAsksRecentViewRoute.name,
                  path: 'recent',
                  parent: SeeAllCollectionsAndAsksViewRoute.name),
              _i3.RouteConfig(CollectionsAndAsksPopularViewRoute.name,
                  path: 'popular',
                  parent: SeeAllCollectionsAndAsksViewRoute.name)
            ]),
        _i3.RouteConfig(SeeAllContentArchiveViewRoute.name,
            path: 'see_all_content_archive',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAllContentArchiveViewRoute.name,
                  redirectTo: 'most_recommended',
                  fullMatch: true),
              _i3.RouteConfig(ContentArchiveMostRecommendedViewRoute.name,
                  path: 'most_recommended',
                  parent: SeeAllContentArchiveViewRoute.name),
              _i3.RouteConfig(ContentArchiveRecentRoute.name,
                  path: 'recent', parent: SeeAllContentArchiveViewRoute.name)
            ]),
        _i3.RouteConfig(SeeAllRecentAsksRoute.name,
            path: 'see_all_recent_asks',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAllRecentAsksRoute.name,
                  redirectTo: 'recent',
                  fullMatch: true),
              _i3.RouteConfig(RecentAsksRecentRoute.name,
                  path: 'recent', parent: SeeAllRecentAsksRoute.name),
              _i3.RouteConfig(RecentAsksPopularRoute.name,
                  path: 'popular', parent: SeeAllRecentAsksRoute.name)
            ]),
        _i3.RouteConfig(SeeAllPopularTopicsRoute.name,
            path: 'see_all_popular_topics'),
        _i3.RouteConfig(SeeAllInspiringPeopleRoute.name,
            path: 'see_all_inspiring_people',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAllInspiringPeopleRoute.name,
                  redirectTo: 'creators',
                  fullMatch: true),
              _i3.RouteConfig(InspiringPeopleCreatorsRoute.name,
                  path: 'creators', parent: SeeAllInspiringPeopleRoute.name),
              _i3.RouteConfig(InspiringPeopleCommunityRoute.name,
                  path: 'community', parent: SeeAllInspiringPeopleRoute.name)
            ]),
        _i3.RouteConfig(SeeAllFeaturedCollectionsRoute.name,
            path: 'see_all_featured_collections',
            children: [
              _i3.RouteConfig('#redirect',
                  path: '',
                  parent: SeeAllFeaturedCollectionsRoute.name,
                  redirectTo: 'recently_featured',
                  fullMatch: true),
              _i3.RouteConfig(FeaturedCollectionsRecentlyFeaturedRoute.name,
                  path: 'recently_featured',
                  parent: SeeAllFeaturedCollectionsRoute.name),
              _i3.RouteConfig(FeaturedCollectionsPopularRoute.name,
                  path: 'popular', parent: SeeAllFeaturedCollectionsRoute.name)
            ]),
        _i3.RouteConfig(EntryPointRoute.name, path: '/entry'),
        _i3.RouteConfig(InitialScreenRoute.name, path: '/initial'),
        _i3.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i3.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i3.RouteConfig(LoginScreen2Route.name, path: '/login2'),
        _i3.RouteConfig(OtherProfileScreenRoute.name, path: '/other_profile'),
        _i3.RouteConfig(ResetPasswordViewRoute.name, path: '/forgot'),
        _i3.RouteConfig(ResetPasswordNewRoute.name, path: '/forgot_new'),
        _i3.RouteConfig(MyRegisterRoute.name, path: '/register'),
        _i3.RouteConfig(ConfirmRegisterViewRoute.name,
            path: '/register_confirm'),
        _i3.RouteConfig(OnboardingScreenRoute.name,
            path: '/onboarding',
            children: [
              _i3.RouteConfig(EditOnboardingRoute.name,
                  path: '', parent: OnboardingScreenRoute.name),
              _i3.RouteConfig(UserOnboarding1Route.name,
                  path: 'userOnboarding1', parent: OnboardingScreenRoute.name),
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
              path: 'my_profile', parent: HomeRoute.name),
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
/// [_i1.NotificationsScreen]
class NotificationsScreenRoute extends _i3.PageRouteInfo<void> {
  const NotificationsScreenRoute()
      : super(NotificationsScreenRoute.name, path: 'notification_screen');

  static const String name = 'NotificationsScreenRoute';
}

/// generated route for
/// [_i1.EmailSettings]
class EmailSettingsRoute extends _i3.PageRouteInfo<void> {
  const EmailSettingsRoute()
      : super(EmailSettingsRoute.name, path: 'email_settings');

  static const String name = 'EmailSettingsRoute';
}

/// generated route for
/// [_i1.PasswordSettings]
class PasswordSettingsRoute extends _i3.PageRouteInfo<void> {
  const PasswordSettingsRoute()
      : super(PasswordSettingsRoute.name, path: 'password_settings');

  static const String name = 'PasswordSettingsRoute';
}

/// generated route for
/// [_i1.SeeAllCollectionsAndAsksView]
class SeeAllCollectionsAndAsksViewRoute extends _i3.PageRouteInfo<void> {
  const SeeAllCollectionsAndAsksViewRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllCollectionsAndAsksViewRoute.name,
            path: 'see_all_collections_and_asks', initialChildren: children);

  static const String name = 'SeeAllCollectionsAndAsksViewRoute';
}

/// generated route for
/// [_i1.SeeAllContentArchiveView]
class SeeAllContentArchiveViewRoute extends _i3.PageRouteInfo<void> {
  const SeeAllContentArchiveViewRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllContentArchiveViewRoute.name,
            path: 'see_all_content_archive', initialChildren: children);

  static const String name = 'SeeAllContentArchiveViewRoute';
}

/// generated route for
/// [_i1.SeeAllRecentAsks]
class SeeAllRecentAsksRoute extends _i3.PageRouteInfo<void> {
  const SeeAllRecentAsksRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllRecentAsksRoute.name,
            path: 'see_all_recent_asks', initialChildren: children);

  static const String name = 'SeeAllRecentAsksRoute';
}

/// generated route for
/// [_i1.SeeAllPopularTopics]
class SeeAllPopularTopicsRoute extends _i3.PageRouteInfo<void> {
  const SeeAllPopularTopicsRoute()
      : super(SeeAllPopularTopicsRoute.name, path: 'see_all_popular_topics');

  static const String name = 'SeeAllPopularTopicsRoute';
}

/// generated route for
/// [_i1.SeeAllInspiringPeople]
class SeeAllInspiringPeopleRoute extends _i3.PageRouteInfo<void> {
  const SeeAllInspiringPeopleRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllInspiringPeopleRoute.name,
            path: 'see_all_inspiring_people', initialChildren: children);

  static const String name = 'SeeAllInspiringPeopleRoute';
}

/// generated route for
/// [_i1.SeeAllFeaturedCollections]
class SeeAllFeaturedCollectionsRoute extends _i3.PageRouteInfo<void> {
  const SeeAllFeaturedCollectionsRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllFeaturedCollectionsRoute.name,
            path: 'see_all_featured_collections', initialChildren: children);

  static const String name = 'SeeAllFeaturedCollectionsRoute';
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
/// [_i1.OtherProfileScreen]
class OtherProfileScreenRoute extends _i3.PageRouteInfo<void> {
  const OtherProfileScreenRoute()
      : super(OtherProfileScreenRoute.name, path: '/other_profile');

  static const String name = 'OtherProfileScreenRoute';
}

/// generated route for
/// [_i1.ResetPasswordView]
class ResetPasswordViewRoute extends _i3.PageRouteInfo<void> {
  const ResetPasswordViewRoute()
      : super(ResetPasswordViewRoute.name, path: '/forgot');

  static const String name = 'ResetPasswordViewRoute';
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
class ConfirmRegisterViewRoute extends _i3.PageRouteInfo<void> {
  const ConfirmRegisterViewRoute()
      : super(ConfirmRegisterViewRoute.name, path: '/register_confirm');

  static const String name = 'ConfirmRegisterViewRoute';
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
class CollectionsAndAsksRecentViewRoute extends _i3.PageRouteInfo<void> {
  const CollectionsAndAsksRecentViewRoute()
      : super(CollectionsAndAsksRecentViewRoute.name, path: 'recent');

  static const String name = 'CollectionsAndAsksRecentViewRoute';
}

/// generated route for
/// [_i1.CollectionsAndAsksPopularView]
class CollectionsAndAsksPopularViewRoute extends _i3.PageRouteInfo<void> {
  const CollectionsAndAsksPopularViewRoute()
      : super(CollectionsAndAsksPopularViewRoute.name, path: 'popular');

  static const String name = 'CollectionsAndAsksPopularViewRoute';
}

/// generated route for
/// [_i1.ContentArchiveMostRecommendedView]
class ContentArchiveMostRecommendedViewRoute extends _i3.PageRouteInfo<void> {
  const ContentArchiveMostRecommendedViewRoute()
      : super(ContentArchiveMostRecommendedViewRoute.name,
            path: 'most_recommended');

  static const String name = 'ContentArchiveMostRecommendedViewRoute';
}

/// generated route for
/// [_i1.ContentArchiveRecent]
class ContentArchiveRecentRoute extends _i3.PageRouteInfo<void> {
  const ContentArchiveRecentRoute()
      : super(ContentArchiveRecentRoute.name, path: 'recent');

  static const String name = 'ContentArchiveRecentRoute';
}

/// generated route for
/// [_i1.RecentAsksRecent]
class RecentAsksRecentRoute extends _i3.PageRouteInfo<void> {
  const RecentAsksRecentRoute()
      : super(RecentAsksRecentRoute.name, path: 'recent');

  static const String name = 'RecentAsksRecentRoute';
}

/// generated route for
/// [_i1.RecentAsksPopular]
class RecentAsksPopularRoute extends _i3.PageRouteInfo<void> {
  const RecentAsksPopularRoute()
      : super(RecentAsksPopularRoute.name, path: 'popular');

  static const String name = 'RecentAsksPopularRoute';
}

/// generated route for
/// [_i1.InspiringPeopleCreators]
class InspiringPeopleCreatorsRoute extends _i3.PageRouteInfo<void> {
  const InspiringPeopleCreatorsRoute()
      : super(InspiringPeopleCreatorsRoute.name, path: 'creators');

  static const String name = 'InspiringPeopleCreatorsRoute';
}

/// generated route for
/// [_i1.InspiringPeopleCommunity]
class InspiringPeopleCommunityRoute extends _i3.PageRouteInfo<void> {
  const InspiringPeopleCommunityRoute()
      : super(InspiringPeopleCommunityRoute.name, path: 'community');

  static const String name = 'InspiringPeopleCommunityRoute';
}

/// generated route for
/// [_i1.FeaturedCollectionsRecentlyFeatured]
class FeaturedCollectionsRecentlyFeaturedRoute extends _i3.PageRouteInfo<void> {
  const FeaturedCollectionsRecentlyFeaturedRoute()
      : super(FeaturedCollectionsRecentlyFeaturedRoute.name,
            path: 'recently_featured');

  static const String name = 'FeaturedCollectionsRecentlyFeaturedRoute';
}

/// generated route for
/// [_i1.FeaturedCollectionsPopular]
class FeaturedCollectionsPopularRoute extends _i3.PageRouteInfo<void> {
  const FeaturedCollectionsPopularRoute()
      : super(FeaturedCollectionsPopularRoute.name, path: 'popular');

  static const String name = 'FeaturedCollectionsPopularRoute';
}

/// generated route for
/// [_i1.EditOnboarding]
class EditOnboardingRoute extends _i3.PageRouteInfo<void> {
  const EditOnboardingRoute() : super(EditOnboardingRoute.name, path: '');

  static const String name = 'EditOnboardingRoute';
}

/// generated route for
/// [_i1.UserOnboarding1]
class UserOnboarding1Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding1Route()
      : super(UserOnboarding1Route.name, path: 'userOnboarding1');

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
/// [_i1.MyProfileScreen]
class ProfileScreenRoute extends _i3.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(ProfileScreenRoute.name, path: 'my_profile');

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
