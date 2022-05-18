import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upcarta_mobile_app/blocs/app_bloc/bloc/app_bloc.dart';
import 'firebase_options.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:upcarta_mobile_app/navigation//routes.gr.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      /* TODO: INJECT AUTHENTICATION REPOSITORY
      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;
      runApp(App(authenticationRepository: authenticationRepository)); */

      runApp(MyFirebaseApp());
    },
    // blocObserver: AppBlocObserver(),
  );
}

class MyFirebaseApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();
  final _appRouter = AppRouter();

  MyFirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("Error: cannot initialize firebase"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            title: 'Upcarta',
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            theme: ThemeData.light(),
            builder: (context, router) => router!,
          );
        }
        return const MaterialApp(
          home: Center(
            child: Text("Waiting to initialize firebase"),
          ),
        );
      },
    );
  }
}
