// CAN

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'package:upcarta_mobile_app/ui/screens/home.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:upcarta_mobile_app/service/auth_service.dart';

import '../../app/app.dart';
import '../../navigation/routes.gr.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // comment out next line if you wanna stay on splash screen page more than 2 seconds
  //   // Provider.of<AppStateManager>(context, listen: false).initializeApp();
  // }

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocProvider(
            create: (context) =>
                AppBloc(authRepository: context.read<AuthRepository>()),
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return SplashScreenWidget();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    _dispatchEvent(
        context); // This will dispatch the navigateToHomeScreen event.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/upcarta-logo-small.png",
              ),
              const SizedBox(
                width: 7,
              ),
              const Text(
                "Upcarta",
                style: splashTitleStyle,
              )
            ],
          ),
          TextButton(
            child: const Text("GO LOGIN"),
            onPressed: () {
              context.router.push(LoginScreenRoute());
              // context.router.push(HomeRoute());
            },
          ),
          TextButton(
            child: const Text("GO HOME"),
            onPressed: () {
              // context.router.push(LoginScreenRoute());
              context.router.push(HomeRoute());
            },
          ),
        ],
      ),
    );
  }

  //This method will dispatch the navigateToHomeScreen event.
  void _dispatchEvent(BuildContext context) {
    BlocProvider.of<AppBloc>(context).add(
      NavigateToHomeScreenEvent(),
    );
  }
}
