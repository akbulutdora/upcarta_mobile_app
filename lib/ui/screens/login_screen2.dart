import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:upcarta_mobile_app/app/bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/service/auth_service.dart';
import 'package:upcarta_mobile_app/cubits/login/login_cubit.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  State<LoginScreen2> createState() => _LoginScreen2();

  const LoginScreen2({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      child: const LoginScreen2(),
    );
  }
}

class _LoginScreen2 extends State<LoginScreen2> {
  final _formKey = GlobalKey<FormState>();
  AuthService _authService = AuthService();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  void setLoginState(String inp1, String inp2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("uEmail", inp1);
    prefs.setString("uPass", inp2);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final user = context.select((AppBloc bloc) => bloc.state.user);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                context.read<AppBloc>().add(AppLogoutRequested());
              },
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.secondary,
                  size: 30,
                ))
          ],
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              user.email!,
              style: const TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.pause_circle,
              size: 30,
              color: AppColors.primary,
            ),
          ]),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (context) => LoginCubit(context.read<AuthRepository>()),
            child: const SingleChildScrollView(
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          // HANDLE ERROR
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //     SnackBar(
          //       content: Text(state.errorMessage ?? 'Authentication Failure'),
          //     ),
          //   );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/upcarta-logo-small.png",
                height: 120,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text("Sign in with email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 30,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              const SizedBox(height: 16),
              _EmailInput(),
              const SizedBox(height: 16),
              _PasswordInput(),
              const SizedBox(height: 16),
              _LoginButton(),
              const SizedBox(height: 16),
              // _GoogleLoginButton(),
              // const SizedBox(height: 4),
              _SignUpButton(),
              TextButton(
                onPressed: () async {
                  context.router.push(ResetPasswordRoute());
                },
                child: const Text(
                  'Forgot password?',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () async {
                  context.router.push(LoginScreenRoute());
                },
                child: const Text(
                  "Resend Verification Email?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : OutlinedButton(
                onPressed: () {
                  context.read<LoginCubit>().logInWithCredential();
                  AutoRouter.of(context).push(const HomeRoute());
                },
                key: const Key('loginForm_continue_raisedButton'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.indigoAccent,
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.03),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 50,
                      fontWeight: FontWeight.bold),
                ),
              );
      },
    );
  }
}

// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return ElevatedButton.icon(
//       key: const Key('loginForm_googleLogin_raisedButton'),
//       label: const Text(
//         'SIGN IN WITH GOOGLE',
//         style: TextStyle(color: Colors.white),
//       ),
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         primary: theme.colorScheme.secondary,
//       ),
//       icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
//       onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
//     );
//   }
// }

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => AutoRouter.of(context).push(const MyRegisterRoute()),
      child: Text(
        'CREATE ACCOUNT',
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }
}
