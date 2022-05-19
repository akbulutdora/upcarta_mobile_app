import 'package:auto_route/auto_route.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authRepository: _authRepository,
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

final _navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get _navigator => _navigatorKey.currentState!;

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
    AutoRouter.of(context);
    return BlocListener<AppBloc, AppState>(
      child: const SplashScreen(),
      listener: (context, state) {
        switch (state.status) {
          case AppStatus.authenticated:
            // _navigator.pushAndRemoveUntil<void>(
            //   Home.route(),
            //   (route) => false,
            // );
            print("\n\n\nAUTHENTICATED");
            AutoRouter.of(context).push(const HomeRoute());
            break;
          case AppStatus.unauthenticated:
            // _navigator.pushAndRemoveUntil<void>(
            //   LoginScreen.route(),
            //   (route) => false,
            // );
            print("\n\n\nNOT AUTHENTICATED");
            AutoRouter.of(context).push(const LoginScreenRoute());
            break;
          default:
            break;
        }
      },
    );
  }
}
