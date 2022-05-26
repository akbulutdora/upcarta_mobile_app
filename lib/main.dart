import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';

Future<void> main() async {
  // DONE: IMPLEMENT APP RUNNING (REOPENING AFTER SPLASH IS VIEWED)
  // FIXME: ANDROID SPLAH TOO DARK
  // DONE: IMPLEMENT APP INITIALIZED (LANDING VIEWED) WITH SHARED PREF
  // DONE: IMPLEMENT LOGGED IN WITH SHARED PREF
  // DONE: IMPLEMENT ONBOARDING AFTER REGISTER
  // TODO: IMPLEMENT ONBOARDING COMPLETED (TALK TO OTHERS ABOUT WHAT IF ONBOARDING LEFT IN HALF)
  // DONE: IMPLEMENT EXITING APP AFTER BACK BUTTON IN FEED
  // FIXME: BACKBUTTON BEHAVIOR AT HOME SCREENS EXCEPT FOR FEED
  // TODO: HOCAYA SOR, BİRDEN FAZLA REPOSITORY NASIL INJECT EDİLİR
  // TODO: HOCAYA SOR, USER REPOSITORY VE AUTH REPOSITORY AYNI USER MODELE NASIL ERİŞEBİLİR
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authenticationRepository =
          AuthenticationRepository(sharedPreferences: sharedPreferences);
      await authenticationRepository.user.first;
      final userRepository =
      UserRepository();
      // await authRepository.user.first;
      runApp(
        App(
          authRepository: authenticationRepository,
          userRepository: userRepository,
          sharedPreferences: sharedPreferences,
        ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
