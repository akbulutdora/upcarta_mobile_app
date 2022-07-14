import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/app/bloc/app_bloc.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import '../../../app/bloc/app_bloc.dart';
import 'package:upcarta_mobile_app/routes/login/login.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();

  const LoginScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return const MaterialPage(
      child: LoginScreen(),
    );
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).appBarTheme.backgroundColor),
        elevation: 0,
        titleSpacing: 0.0,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/upcarta-logo-small.png',
              height: 30.h, width: 30.w),
          SizedBox(width: 8.w),
          Text(
            'Upcarta',
            style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ]),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
        child: const SingleChildScrollView(
          // child: const SingleChildScrollView(
          child: LoginMainViewButtons(),
        ),
      ),
    );
  }
}

class LoginMainViewButtons extends StatelessWidget {
  const LoginMainViewButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.googleSignup) {
          // AutoRouter.of(context).replace(const HomeRoute());
          AutoRouter.of(context).replaceAll([const OnboardingScreenRoute()]);
        }
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 80.h,
                ),
                child: Text(
                  'Discover, collect and share\n great content.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(height: 64.h),
          SizedBox(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.fromLTRB(62.w, 13.h, 62.w, 14.h),
                  side: const BorderSide(color: Colors.lightBlue)),
              child: Text(
                'Continue with Twitter',
                style: TextStyle(color: Theme.of(context).floatingActionButtonTheme.foregroundColor, fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            child: OutlinedButton(
              onPressed: () {
                context.read<LoginCubit>().logInWithGoogle();
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  backgroundColor: Theme.of(context).floatingActionButtonTheme.foregroundColor,
                  padding: EdgeInsets.fromLTRB(62.w, 13.h, 62.w, 14.h),
                  side: BorderSide(color: Theme.of(context).appBarTheme.foregroundColor!, width: 1)),
              child: Text(
                'Continue with Google',
                style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor, fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
                  padding: EdgeInsets.fromLTRB(67.w, 13.h, 67.w, 14.h),
                  side: BorderSide(color: Theme.of(context).appBarTheme.foregroundColor!)),
              child: Text(
                'Continue with Apple',
                style: TextStyle(color: Theme.of(context).floatingActionButtonTheme.foregroundColor, fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Divider(
                      indent: 48.w,
                      thickness: 1.h,
                      color: Theme.of(context).dividerTheme.color,
                    ),
                  ],
                ),
              ),
              Text('     OR     ',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Theme.of(context).dividerTheme.color)),
              Expanded(
                child: Column(
                  children: [
                    Divider(
                      endIndent: 48.w,
                      thickness: 1.h,
                      color: Theme.of(context).dividerTheme.color,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            child: OutlinedButton(
              onPressed: () async {
                context.router.push(const MyRegisterRoute());
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  backgroundColor:  Theme.of(context).primaryColor,
                  padding: EdgeInsets.fromLTRB(111.w, 13.h, 111.w, 14.h),
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Theme.of(context).floatingActionButtonTheme.foregroundColor, fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        context.router.push(const LoginScreen2Route());
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(42.w, 8.h, 42.w, 8.h),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Have an account already?  ',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color:
                                          Theme.of(context).iconTheme.color)),
                              TextSpan(
                                  text: 'LOG IN',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(52.w, 0.h, 52.w, 0.h),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'By signing up you agree to our ',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Theme.of(context).iconTheme.color)),
                        TextSpan(
                            text: 'Terms, Privacy Policy, and Cookie Use',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).iconTheme.color)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BlocListener<AppBloc, AppState>(
            listener: (context, state) async {
              if (state == const AppState.prelanded()) {
                context.router.replace(const LandingRoute());
              }
            },
            child: TextButton(
              onPressed: () {
                context.read<AppBloc>().add(AppLandedCanceled());
                if (kDebugMode) {
                  print('landed canceled\n\n\n');
                }
              },
              child: const Text('Press to cancel landed'),
            ),
          ),
        ],
      ),
    );
  }
}
