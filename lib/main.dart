import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/repositories/query_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      final authenticationRepository =
          AuthenticationRepository(sharedPreferences: sharedPreferences);
      await authenticationRepository.user.first;
      final userRepository =
          UserRepository(sharedPreferences: sharedPreferences);
      final queryRepository = QueryRepository();
      final analyticsRepository = AnalyticsRepository();

      // await authRepository.user.first;
      runApp(
        App(
          authRepository: authenticationRepository,
          userRepository: userRepository,
          analyticsRepository: analyticsRepository,
          sharedPreferences: sharedPreferences,
          queryRepository: queryRepository,
        ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
