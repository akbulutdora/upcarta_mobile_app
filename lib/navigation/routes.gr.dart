// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:upcarta_mobile_app/ui/screens/screens.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    },
    HomeRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    UserOnboarding1Route.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UserOnboarding1());
    },
    UserOnboarding2Route.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UserOnboarding2());
    },
    UserOnboarding3Route.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UserOnboarding3());
    },
    UserOnboarding4Route.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UserOnboarding4());
    },
    FeedScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.FeedScreen());
    },
    ExploreScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ExploreScreen());
    },
    NewPostScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.NewPostScreen());
    },
    MyLibraryScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MyLibraryScreen());
    },
    ProfileScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ProfileScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i2.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i2.RouteConfig(LoginScreenRoute.name, path: '/login'),
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
              path: 'feed', parent: HomeRoute.name),
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
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i2.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i2.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
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
/// [_i1.Home]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.UserOnboarding1]
class UserOnboarding1Route extends _i2.PageRouteInfo<void> {
  const UserOnboarding1Route() : super(UserOnboarding1Route.name, path: '');

  static const String name = 'UserOnboarding1Route';
}

/// generated route for
/// [_i1.UserOnboarding2]
class UserOnboarding2Route extends _i2.PageRouteInfo<void> {
  const UserOnboarding2Route()
      : super(UserOnboarding2Route.name, path: 'userOnboarding2');

  static const String name = 'UserOnboarding2Route';
}

/// generated route for
/// [_i1.UserOnboarding3]
class UserOnboarding3Route extends _i2.PageRouteInfo<void> {
  const UserOnboarding3Route()
      : super(UserOnboarding3Route.name, path: 'userOnboarding3');

  static const String name = 'UserOnboarding3Route';
}

/// generated route for
/// [_i1.UserOnboarding4]
class UserOnboarding4Route extends _i2.PageRouteInfo<void> {
  const UserOnboarding4Route()
      : super(UserOnboarding4Route.name, path: 'userOnboarding4');

  static const String name = 'UserOnboarding4Route';
}

/// generated route for
/// [_i1.FeedScreen]
class FeedScreenRoute extends _i2.PageRouteInfo<void> {
  const FeedScreenRoute() : super(FeedScreenRoute.name, path: 'feed');

  static const String name = 'FeedScreenRoute';
}

/// generated route for
/// [_i1.ExploreScreen]
class ExploreScreenRoute extends _i2.PageRouteInfo<void> {
  const ExploreScreenRoute() : super(ExploreScreenRoute.name, path: 'explore');

  static const String name = 'ExploreScreenRoute';
}

/// generated route for
/// [_i1.NewPostScreen]
class NewPostScreenRoute extends _i2.PageRouteInfo<void> {
  const NewPostScreenRoute() : super(NewPostScreenRoute.name, path: 'new');

  static const String name = 'NewPostScreenRoute';
}

/// generated route for
/// [_i1.MyLibraryScreen]
class MyLibraryScreenRoute extends _i2.PageRouteInfo<void> {
  const MyLibraryScreenRoute()
      : super(MyLibraryScreenRoute.name, path: 'myLibrary');

  static const String name = 'MyLibraryScreenRoute';
}

/// generated route for
/// [_i1.ProfileScreen]
class ProfileScreenRoute extends _i2.PageRouteInfo<void> {
  const ProfileScreenRoute() : super(ProfileScreenRoute.name, path: 'profile');

  static const String name = 'ProfileScreenRoute';
}
