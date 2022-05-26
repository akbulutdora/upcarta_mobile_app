import 'package:auto_route/auto_route.dart';

// import 'package:flow_builder/flow_builder.dart'; MAYBE WE SWITCH TI THIS
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/app/theme_cubit/theme_cubit.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';

// import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';

import '../../repositories/user_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authRepository,
    required UserRepository userRepository,
    required this.sharedPreferences,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(key: key);

  final AuthenticationRepository _authRepository;
  final UserRepository _userRepository;
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authRepository,
        ),
        RepositoryProvider.value(
          value: _userRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authRepository: _authRepository,
              sharedPrefs: sharedPreferences,
            ),
          ),
          BlocProvider(create: (_) => ThemeCubit(sharedPreferences)),
        ],
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
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp.router(
          title: 'Upcarta',
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          theme: theme,
          builder: (context, router) => router!,
        );
      },
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
