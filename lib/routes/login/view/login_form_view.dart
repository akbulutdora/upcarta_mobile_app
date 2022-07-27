import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/routes/login/login.dart';

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
    await prefs.setString('uEmail', inp1);
    await prefs.setString('uPass', inp2);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: AppColors.gray1BoxFrame,
          ),
          elevation: 0,
          titleSpacing: 0.0,
          centerTitle: true,
          title: Row(children: [
            SizedBox(width: 80.w),
            Image.asset('assets/images/1x.png', height: 30.h, width: 30.w),
            SizedBox(width: 8.w),
            Text(
              'Upcarta',
              style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 160.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Sign In with Email',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.transparent, // Step 2 SEE HERE
                    shadows: [
                      Shadow(
                          offset: Offset(0, -10.sp),
                          color: Theme.of(context).iconTheme.color!)
                    ],
                    decoration: TextDecoration.underline,
                    decorationColor: Theme.of(context).primaryColor,
                    decorationThickness: 2.sp)),
          ),
          SizedBox(height: 32.h),
          _EmailInput(),
          SizedBox(height: 4.h),
          _EmailError(),
          SizedBox(height: 16.h),
          _PasswordInput(),
          SizedBox(height: 4.h),
          _PasswordError(),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SignUpButton(),
              _LoginButton(),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          _ForgotPassAndVerification(),
        ],
      ),
    );
  }
}
class _EmailError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
    builder: (context, state){
      return Align(alignment: Alignment.centerLeft,
        child: Padding( padding: EdgeInsets.only(left: 12.w),
          child: Visibility(
            child: Text('Enter a valid email', style: TextStyle(
              fontFamily: 'SFCompactText-Regular.ttf',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ), textAlign: TextAlign.start),
           visible:(state.email.value.isLeft() && state.status != LoginStatus.initial) && state.email.value.fold((l) => l.failedValue, (r) => r) != '', maintainSize: true, maintainAnimation: true, maintainState: true,),
        ),
      );
  });
  }
}
class _PasswordError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state){
          return Align(alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Visibility(
                child: Text('Enter a password with more than 8 characters', style: TextStyle(
                  fontFamily: 'SFCompactText-Regular.ttf',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ), textAlign: TextAlign.start),
                //FIXME: simplify returning textinput value
                visible: (state.password.value.isLeft() && state.status != LoginStatus.initial) && state.password.value.fold((l) => l.failedValue, (r) => r) != '', maintainSize: true, maintainAnimation: true, maintainState: true,),
            ),
          );
        });
  }
}
///TODO : Input text size must be defined
class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: TextField(
            key: const Key('loginForm_emailInput_textField'),
            onChanged: (email) {
              context.read<LoginCubit>().emailChanged(email);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              fillColor: Colors.transparent,
              filled: true,
              border: Theme.of(context).inputDecorationTheme.border,
            ),
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
        return SizedBox(
          height: 60.h,
          child: TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password),
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              fillColor: Colors.transparent,
              filled: true,
              border: Theme.of(context).inputDecorationTheme.border,
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatefulWidget {
  @override
  State<_LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<_LoginButton> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            :
          Opacity(
          opacity: (state.email.value.isRight() && state.password.value.isRight()) ? 1 : 0.2,
              child: IgnorePointer(
          ignoring: !(state.email.value.isRight() && state.password.value.isRight()),
                child: OutlinedButton(
                    onPressed: () {
                      context.read<LoginCubit>().logInWithCredential();
                    },
                    key: const Key('loginForm_continue_raisedButton'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.fromLTRB(46.w, 10.h, 46.w, 10.h),
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
              ),
            );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => AutoRouter.of(context).push(const MyRegisterRoute()),
      style: OutlinedButton.styleFrom(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        side: BorderSide(color: AppColors.upcartaBlue),
        backgroundColor: AppColors.white,
        padding: EdgeInsets.fromLTRB(46.w, 10.h, 46.w, 10.h),
      ),
      child: Text(
        'Sign Up',
        style: TextStyle(color: theme.primaryColor, fontSize: 15.sp),
      ),
    );
  }
}
class _ForgotPassAndVerification extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () async {
              await context.router.push(const ResetPasswordViewRoute());
            },
            child: Text(
              'Forgot password?',
              style: TextStyle(
                fontFamily: 'SFCompactText-Regular.ttf',
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.upcartaBlue,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.upcartaBlue,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await context.router.push(const LoginScreenRoute());
            },
            child: Text(
              'Resend Verification Email?',
              style: TextStyle(
                fontFamily: 'SFCompactText-Regular.ttf',
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.upcartaBlue,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.upcartaBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
