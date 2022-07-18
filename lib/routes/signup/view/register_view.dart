import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/routes/signup/signup.dart';



class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  static MaterialPage page() {
    return const MaterialPage(
      child: MyRegister(),
    );
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MyRegister());
  }

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Theme.of(context).appBarTheme.shadowColor,
          ),
          elevation: 0,
          titleSpacing: 0.0,
          centerTitle: true,
          title: Row(children: [
            SizedBox(width: 80.w),
            Image.asset('assets/images/1x.png', height: 30.h, width: 30.w),
            SizedBox(width: 8.w),
            const Text(
              'Upcarta',
              style: kAppBarTextStyle,
            ),
          ]),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 36.w, right: 36.w),
          child: BlocProvider<SignupCubit>(
            create: (_) =>
                SignupCubit(context.read<AuthenticationRepository>()),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 160.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Sign Up',
                        textAlign: TextAlign.start,
                        style: kSignUpTextStyle,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  const SignupForm(),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.success) {
          // AutoRouter.of(context).push(const HomeRoute());
          AutoRouter.of(context).replaceAll([const OnboardingScreenRoute()]);
          // AutoRouter.of(context).push(const OnboardingScreenRoute());

        } else if (state.status == SignupStatus.submissionFailure) {
          // ERROR
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        child: Column(
          children: [
            _EmailInput(),
            SizedBox(height: 16.h),
            _NameInput(),
            SizedBox(height: 16.h),
            _PasswordInput(),
            SizedBox(height: 24.h),
            // _ConfirmPasswordInput(),

            Align(alignment: Alignment.centerRight, child: _SignUpButton()),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: TextField(
            key: const Key('signUpForm_emailInput_textField'),
            onChanged: (email) =>
                context.read<SignupCubit>().emailChanged(email),
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
          ),
        );
      },
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: TextField(
            key: const Key('signUpForm_nameInput_textField'),
            onChanged: (name) => context.read<SignupCubit>().nameChanged(name),
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Name',
              fillColor: Colors.transparent,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
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
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: TextField(
            key: const Key('signUpForm_passwordInput_textField'),
            onChanged: (password) =>
                context.read<SignupCubit>().passwordChanged(password),
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
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final AuthService _authService = AuthService(); OLD
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignupStatus.submitting
            ? const CircularProgressIndicator()
            : OutlinedButton(
                key: const Key('loginForm_createAccount_flatButton'),
                onPressed: () =>
                    context.read<SignupCubit>().signupFormSubmitted(),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  side: BorderSide(color:  Theme.of(context).primaryColor),
                  backgroundColor:  Theme.of(context).primaryColor,
                  padding: EdgeInsets.fromLTRB(46.w, 10.h, 46.w, 10.h),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Theme.of(context).floatingActionButtonTheme.foregroundColor, fontSize: 15.sp),
                ),
              );
      },
    );
  }
}
