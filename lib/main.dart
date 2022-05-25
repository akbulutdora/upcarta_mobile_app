import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'app/app.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;
      // await authRepository.user.first;
      runApp(
          App(authRepository: authenticationRepository, sharedPreferences: sharedPreferences,),
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
