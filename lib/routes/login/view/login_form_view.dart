import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/routes/login/login.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

import '../../../util/colors.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  State<LoginScreen2> createState() => _LoginScreen2();

  const LoginScreen2({Key? key}) : super(key: key);

  static MaterialPage page() {
    return const MaterialPage(
      child: LoginScreen2(),
    );
  }
}

class _LoginScreen2 extends State<LoginScreen2> {
  // final _formKey = GlobalKey<FormState>();
  // AuthService _authService = AuthService();
  // final _passwordController = TextEditingController();
  // final _emailController = TextEditingController();

  void setLoginState(String inp1, String inp2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("uEmail", inp1);
    prefs.setString("uPass", inp2);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/1x.png', height: 30.h, width: 30.w),
            SizedBox(width: 8.w),
            const Text(
              'Upcarta',
              style: kAppBarTextStyle,
            ),
          ]),
          backgroundColor: AppColors.white,
        ),
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 36.w, right: 36.w),
          child: BlocProvider(
            create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
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
        if (state.status == LoginStatus.success) {
          // AutoRouter.of(context).replace(const HomeRoute());
          AutoRouter.of(context).replaceAll([const HomeRoute()]);
        } else if (state.status == LoginStatus.submissionFailure) {
          // TODO: IMPLEMENT SUBMISSION FAILURE ERROR
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Column(
        children: [
          SizedBox(height: 160.h),
          Text("Sign in with email",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600)),
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
              context.router.push(const ResetPasswordViewRoute());
            },
            child: const Text(
              'Forgot password?',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () async {
              context.router.push(const LoginScreenRoute());
            },
            child: const Text(
              "Resend Verification Email?",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
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
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r),
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
                borderRadius: BorderRadius.circular(10.0.r),
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
                },
                key: const Key('loginForm_continue_raisedButton'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  backgroundColor: Colors.indigoAccent,
                  padding: EdgeInsets.fromLTRB(35.w, 10.h, 35.w, 10.h),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
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
