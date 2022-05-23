import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'app/app.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authRepository = AuthRepository();
      // await authRepository.user.first;
      runApp(
        RepositoryProvider.value(
          value: authRepository,
          child: BlocProvider(
            create: (_) => AppBloc(
              authRepository: authRepository,
            ),
            child: App(
              authRepository: authRepository,
            ),
          ),
        ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}

// class Welcome extends StatefulWidget {
//   const Welcome({Key? key}) : super(key: key);

//   @override
  // State<Welcome> createState() => _WelcomeState();
// }

// class _WelcomeState extends State<Welcome> {
//   final _appRouter = AppRouter();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Upcarta',
//       routeInformationParser: _appRouter.defaultRouteParser(),
//       routerDelegate: _appRouter.delegate(),
//       theme: ThemeData.light(),
//       builder: (context, router) => router!,
//     );
//   }
// }
