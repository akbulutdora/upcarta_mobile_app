import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/navigation//routes.gr.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(Home(currentTab: 0));
  runApp(Welcome());
}

class Welcome extends StatefulWidget {

  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // final _profileManager = ProfileManager();
  // final _appStateManager = AppStateManager();
  final _appRouter = AppRouter();

  // @override
  // void initState() {
  //   super.initState();
  //   _appRouter = AppRouter(
  //     // appStateManager: _appStateManager,
  //     // profileManager: _profileManager,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Upcarta',
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData.light(),
      builder: (context, router) => router!,
    );
    // return MultiProvider(
    //   providers: [
    //     BlocProvider<NavigationCubit>(
    //       create: (context) => NavigationCubit(),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (context) => _profileManager,
    //     ),
    //     ChangeNotifierProvider(
    //       create: (context) => _appStateManager,
    //     ),
    //   ],
    //   child: Consumer<ProfileManager>(
    //     builder: (context, profileManager, child) {
    //       ThemeData theme;
    //       if (profileManager.darkMode) {
    //         theme = UpcartaTheme.dark();
    //       } else {
    //         theme = UpcartaTheme.light();
    //       }
    //
    //       return MaterialApp(
    //         theme: theme,
    //         title: 'Upcarta',
    //         home: Router(
    //           routerDelegate: _appRouter,
    //           backButtonDispatcher: RootBackButtonDispatcher(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
