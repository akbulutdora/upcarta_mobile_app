import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/service/auth_service.dart';
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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
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
            Image.asset("assets/images/upcarta-logo-small.png"),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "Upcarta",
              style: kTextStyle3b,
            )
          ]),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider<SignupCubit>(
            create: (_) => SignupCubit(context.read<AuthRepository>()),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.15),
                  Text("Sign up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  const SignupForm(),
                  SizedBox(height: height * 0.05),
                  // Container(
                  //   width: width,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     children: [
                  //       OutlinedButton(
                  //         onPressed: () async {
                  //           _authService
                  //               .createPerson(
                  //                   _nameController.text,
                  //                   _emailController.text,
                  //                   _passwordController.text,
                  //                   _usernameController.text)
                  //               .then((value) {
                  //             // return context.router
                  //             //     .push(MyRegisterConfirmRoute());
                  //             return context.router.push(HomeRoute());
                  //           });
                  //         },
                  //         style: OutlinedButton.styleFrom(
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(12)),
                  //           backgroundColor: Colors.indigoAccent,
                  //           padding:
                  //               EdgeInsets.symmetric(vertical: height * 0.03),
                  //         ),
                  //         child: Text(
                  //           'Sign Up',
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: height / 50,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
          AutoRouter.of(context).push(const HomeRoute());
        } else if (state.status == SignupStatus.error) {
          // ERROR
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //     SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
          //   );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _EmailInput(),
            const SizedBox(height: 16),
            _NameInput(),
            const SizedBox(
              height: 8,
            ),
            _UsernameInput(),
            const SizedBox(height: 16),
            _PasswordInput(),
            const SizedBox(height: 16),
            // _ConfirmPasswordInput(),

            _SignUpButton(),
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
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.read<SignupCubit>().emailChanged(email),
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

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
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
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<SignupCubit>().usernameChanged(username),
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Username',
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
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
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
        );
      },
    );
  }
}

// class _ConfirmPasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignupCubit, SignupState>(
//       buildWhen: (previous, current) =>
//           previous.password != current.password ||
//           previous.confirmedPassword != current.confirmedPassword,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('signUpForm_confirmedPasswordInput_textField'),
//           onChanged: (confirmPassword) => context
//               .read<SignupCubit>()
//               .confirmedPasswordChanged(confirmPassword),
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: 'confirm password',
//             helperText: '',
//             errorText: state.confirmedPassword.invalid
//                 ? 'passwords do not match'
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final AuthService _authService = AuthService(); OLD
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignupStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<SignupCubit>().signupFormSubmitted();
                  // _authService
                  //     .createPerson(state.name, state.email, state.password,
                  //         state.username)
                  //     .then((value) {
                  //   // return context.router
                  //   //     .push(MyRegisterConfirmRoute());
                  //   return context.router.push(HomeRoute());
                  // });
                },
                key: const Key('signUpForm_continue_raisedButton'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.indigoAccent,
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.03),
                ),
                child: Text(
                  'Sign Up',
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
