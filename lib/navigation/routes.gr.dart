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
import 'package:upcarta_mobile_app/app/app.dart' as _i1;
import 'package:upcarta_mobile_app/util/view_paths.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    EntryPointRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EntryPoint());
    },
    LandingRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LandingPage());
    },
    SplashScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    LoginScreen2Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen2());
    },
    ResetPasswordViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ResetPasswordView());
    },
    ResetPasswordNewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ResetPasswordNew());
    },
    MyRegisterRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MyRegister());
    },
    ConfirmRegisterViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ConfirmRegisterView());
    },
    HomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.Home());
    },
    EditProfileRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EditProfileScreen());
    },
    SettingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.Settings());
    },
    NotificationSettingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.NotificationSettings());
    },
    NotificationsScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.NotificationsScreen());
    },
    EmailSettingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmailSettings());
    },
    PasswordSettingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.PasswordSettings());
    },
    SeeAllCollectionsAndAsksViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i2.SeeAllCollectionsAndAsksView());
    },
    OtherProfileScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.OtherProfileScreen());
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    FeedScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.FeedScreen());
    },
    ExploreScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ExploreScreen());
    },
    NewPostScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.NewPostScreen());
    },
    MyLibraryScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MyLibraryScreen());
    },
    ProfileScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MyProfileScreen());
    },
    LatestScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LatestView());
    },
    TopScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.TopView());
    },
    CollectionsAndAsksRecentViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i2.CollectionsAndAsksRecentView());
    },
    CollectionsAndAsksPopularViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i2.CollectionsAndAsksPopularView());
    },
    EditOnboardingRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EditOnboarding());
    },
    UserOnboarding1Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UserOnboarding1());
    },
    UserOnboarding2Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UserOnboarding2());
    },
    UserOnboarding3Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UserOnboarding3());
    },
    UserOnboarding4Route.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UserOnboarding4());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/entry', fullMatch: true),
        _i3.RouteConfig(EntryPointRoute.name, path: '/entry'),
        _i3.RouteConfig(LandingRoute.name, path: 'landing'),
        _i3.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i3.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i3.RouteConfig(LoginScreen2Route.name, path: '/login2'),
        _i3.RouteConfig(ResetPasswordViewRoute.name, path: '/forgot'),
        _i3.RouteConfig(ResetPasswordNewRoute.name, path: '/forgot_new'),
        _i3.RouteConfig(MyRegisterRoute.name, path: '/register'),
        _i3.RouteConfig(ConfirmRegisterViewRoute.name,
            path: '/register_confirm'),
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
        _i3.RouteConfig(OtherProfileScreenRoute.name, path: '/other_profile'),
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
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.EntryPoint]
class EntryPointRoute extends _i3.PageRouteInfo<void> {
  const EntryPointRoute() : super(EntryPointRoute.name, path: '/entry');

  static const String name = 'EntryPointRoute';
}

/// generated route for
/// [_i2.LandingPage]
class LandingRoute extends _i3.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: 'landing');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreenRoute extends _i3.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i3.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen2]
class LoginScreen2Route extends _i3.PageRouteInfo<void> {
  const LoginScreen2Route() : super(LoginScreen2Route.name, path: '/login2');

  static const String name = 'LoginScreen2Route';
}

/// generated route for
/// [_i2.ResetPasswordView]
class ResetPasswordViewRoute extends _i3.PageRouteInfo<void> {
  const ResetPasswordViewRoute()
      : super(ResetPasswordViewRoute.name, path: '/forgot');

  static const String name = 'ResetPasswordViewRoute';
}

/// generated route for
/// [_i2.ResetPasswordNew]
class ResetPasswordNewRoute extends _i3.PageRouteInfo<void> {
  const ResetPasswordNewRoute()
      : super(ResetPasswordNewRoute.name, path: '/forgot_new');

  static const String name = 'ResetPasswordNewRoute';
}

/// generated route for
/// [_i2.MyRegister]
class MyRegisterRoute extends _i3.PageRouteInfo<void> {
  const MyRegisterRoute() : super(MyRegisterRoute.name, path: '/register');

  static const String name = 'MyRegisterRoute';
}

/// generated route for
/// [_i2.ConfirmRegisterView]
class ConfirmRegisterViewRoute extends _i3.PageRouteInfo<void> {
  const ConfirmRegisterViewRoute()
      : super(ConfirmRegisterViewRoute.name, path: '/register_confirm');

  static const String name = 'ConfirmRegisterViewRoute';
}

/// generated route for
/// [_i2.Home]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EditProfileScreen]
class EditProfileRoute extends _i3.PageRouteInfo<void> {
  const EditProfileRoute() : super(EditProfileRoute.name, path: 'edit_profile');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i2.Settings]
class SettingsRoute extends _i3.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i2.NotificationSettings]
class NotificationSettingsRoute extends _i3.PageRouteInfo<void> {
  const NotificationSettingsRoute()
      : super(NotificationSettingsRoute.name, path: 'notification_settings');

  static const String name = 'NotificationSettingsRoute';
}

/// generated route for
/// [_i2.NotificationsScreen]
class NotificationsScreenRoute extends _i3.PageRouteInfo<void> {
  const NotificationsScreenRoute()
      : super(NotificationsScreenRoute.name, path: 'notification_screen');

  static const String name = 'NotificationsScreenRoute';
}

/// generated route for
/// [_i2.EmailSettings]
class EmailSettingsRoute extends _i3.PageRouteInfo<void> {
  const EmailSettingsRoute()
      : super(EmailSettingsRoute.name, path: 'email_settings');

  static const String name = 'EmailSettingsRoute';
}

/// generated route for
/// [_i2.PasswordSettings]
class PasswordSettingsRoute extends _i3.PageRouteInfo<void> {
  const PasswordSettingsRoute()
      : super(PasswordSettingsRoute.name, path: 'password_settings');

  static const String name = 'PasswordSettingsRoute';
}

/// generated route for
/// [_i2.SeeAllCollectionsAndAsksView]
class SeeAllCollectionsAndAsksViewRoute extends _i3.PageRouteInfo<void> {
  const SeeAllCollectionsAndAsksViewRoute({List<_i3.PageRouteInfo>? children})
      : super(SeeAllCollectionsAndAsksViewRoute.name,
            path: 'see_all_collections_and_asks', initialChildren: children);

  static const String name = 'SeeAllCollectionsAndAsksViewRoute';
}

/// generated route for
/// [_i2.OtherProfileScreen]
class OtherProfileScreenRoute extends _i3.PageRouteInfo<void> {
  const OtherProfileScreenRoute()
      : super(OtherProfileScreenRoute.name, path: '/other_profile');

  static const String name = 'OtherProfileScreenRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingScreenRoute extends _i3.PageRouteInfo<void> {
  const OnboardingScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(OnboardingScreenRoute.name,
            path: '/onboarding', initialChildren: children);

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i2.FeedScreen]
class FeedScreenRoute extends _i3.PageRouteInfo<void> {
  const FeedScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(FeedScreenRoute.name, path: 'feed', initialChildren: children);

  static const String name = 'FeedScreenRoute';
}

/// generated route for
/// [_i2.ExploreScreen]
class ExploreScreenRoute extends _i3.PageRouteInfo<void> {
  const ExploreScreenRoute() : super(ExploreScreenRoute.name, path: 'explore');

  static const String name = 'ExploreScreenRoute';
}

/// generated route for
/// [_i2.NewPostScreen]
class NewPostScreenRoute extends _i3.PageRouteInfo<void> {
  const NewPostScreenRoute() : super(NewPostScreenRoute.name, path: 'new');

  static const String name = 'NewPostScreenRoute';
}

/// generated route for
/// [_i2.MyLibraryScreen]
class MyLibraryScreenRoute extends _i3.PageRouteInfo<void> {
  const MyLibraryScreenRoute()
      : super(MyLibraryScreenRoute.name, path: 'myLibrary');

  static const String name = 'MyLibraryScreenRoute';
}

/// generated route for
/// [_i2.MyProfileScreen]
class ProfileScreenRoute extends _i3.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(ProfileScreenRoute.name, path: 'my_profile');

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i2.LatestView]
class LatestScreenRoute extends _i3.PageRouteInfo<void> {
  const LatestScreenRoute() : super(LatestScreenRoute.name, path: 'latest');

  static const String name = 'LatestScreenRoute';
}

/// generated route for
/// [_i2.TopView]
class TopScreenRoute extends _i3.PageRouteInfo<void> {
  const TopScreenRoute() : super(TopScreenRoute.name, path: 'top');

  static const String name = 'TopScreenRoute';
}

/// generated route for
/// [_i2.CollectionsAndAsksRecentView]
class CollectionsAndAsksRecentViewRoute extends _i3.PageRouteInfo<void> {
  const CollectionsAndAsksRecentViewRoute()
      : super(CollectionsAndAsksRecentViewRoute.name, path: 'recent');

  static const String name = 'CollectionsAndAsksRecentViewRoute';
}

/// generated route for
/// [_i2.CollectionsAndAsksPopularView]
class CollectionsAndAsksPopularViewRoute extends _i3.PageRouteInfo<void> {
  const CollectionsAndAsksPopularViewRoute()
      : super(CollectionsAndAsksPopularViewRoute.name, path: 'popular');

  static const String name = 'CollectionsAndAsksPopularViewRoute';
}

/// generated route for
/// [_i2.EditOnboarding]
class EditOnboardingRoute extends _i3.PageRouteInfo<void> {
  const EditOnboardingRoute() : super(EditOnboardingRoute.name, path: '');

  static const String name = 'EditOnboardingRoute';
}

/// generated route for
/// [_i2.UserOnboarding1]
class UserOnboarding1Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding1Route()
      : super(UserOnboarding1Route.name, path: 'userOnboarding1');

  static const String name = 'UserOnboarding1Route';
}

/// generated route for
/// [_i2.UserOnboarding2]
class UserOnboarding2Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding2Route()
      : super(UserOnboarding2Route.name, path: 'userOnboarding2');

  static const String name = 'UserOnboarding2Route';
}

/// generated route for
/// [_i2.UserOnboarding3]
class UserOnboarding3Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding3Route()
      : super(UserOnboarding3Route.name, path: 'userOnboarding3');

  static const String name = 'UserOnboarding3Route';
}

/// generated route for
/// [_i2.UserOnboarding4]
class UserOnboarding4Route extends _i3.PageRouteInfo<void> {
  const UserOnboarding4Route()
      : super(UserOnboarding4Route.name, path: 'userOnboarding4');

  static const String name = 'UserOnboarding4Route';
}
