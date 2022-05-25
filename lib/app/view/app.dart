import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
// import 'package:flow_builder/flow_builder.dart'; MAYBE WE SWITCH TI THIS
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
// import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authRepository,
    required this.sharedPreferences,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthenticationRepository _authRepository;
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authRepository: _authRepository,
          sharedPrefs: sharedPreferences,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

// OUR NAVIGATION WORKS DIFFERENT SOOO WE MAYBE USE THE FOLLOWING LATER
// final _navigatorKey = GlobalKey<NavigatorState>();
// NavigatorState get _navigator => _navigatorKey.currentState!;

class _AppViewState extends State<AppView> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Upcarta',
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData.light(),
      builder: (context, router) => router!,
    );
  }
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //AutoRouter.of(context);
    return BlocListener<AppBloc, AppState>(
      child: const SplashScreen(),
      listener: (context, state) {
        // DONE: IMPLEMENT APP RUNNING (REOPENING AFTER SPLASH IS VIEWED)
        // FIXME: ANDROID SPLAH TOO DARK
        // DONE: IMPLEMENT APP INITIALIZED (LANDING VIEWED) WITH SHARED PREF
        // DONE: IMPLEMENT LOGGED IN WITH SHARED PREF
        // DONE: IMPLEMENT ONBOARDING AFTER REGISTER
        // TODO: IMPLEMENT ONBOARDING COMPLETED (TALK TO OTHERS ABOUT WHAT IF ONBOARDING LEFT IN HALF)
        // DONE: IMPLEMENT EXITING APP AFTER BACK BUTTON IN FEED
        // FIXME: BACKBUTTON BEHAVIOR AT HOME SCREENS EXCEPT FOR FEED
        switch (state.status) {
          case AppStatus.authenticated:
            // print("\n\n\nAUTHENTICATED");
            AutoRouter.of(context).replace(const HomeRoute());
            break;
          case AppStatus.prelanded:
            AutoRouter.of(context).replace(const LandingRoute());
            break;
          case AppStatus.unauthenticated:
            // print("\n\n\nNOT AUTHENTICATED");
            AutoRouter.of(context).replace(const LoginScreenRoute());
            break;
          default:
            break;
        }
      },
    );
  }
}
