import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../app/bloc/app_bloc.dart';

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
  // final _formKey = GlobalKey<FormState>();

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print("SIGNED IN");
    print(FirebaseAuth.instance.signInWithCredential(credential));

    // // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.pause_circle,
              size: 30,
              color: AppColors.primary,
            ),
            const Text(
              'Upcarta',
              style: kAppBarTextStyle,
            ),
          ]),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: height * 0.05,
                    ),
                    child: Text(
                      'Discover, collect \n and share great content.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.black, fontSize: height / 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .10),
              SizedBox(
                //height: height * 0.07,
                width: width,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.lightBlue,
                      padding: EdgeInsets.symmetric(vertical: height * 0.03)),
                  child: Text(
                    'Continue with Twitter',
                    style:
                        TextStyle(color: Colors.white, fontSize: height / 50),
                  ),
                ),
              ),
              SizedBox(height: height * .025),
              SizedBox(
                //height: height * 0.07,
                width: width,
                child: OutlinedButton(
                  onPressed: () {
                    signInWithGoogle();
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: height * 0.03)),
                  child: Text(
                    'Continue with Google',
                    style:
                        TextStyle(color: Colors.black, fontSize: height / 50),
                  ),
                ),
              ),
              SizedBox(height: height * .025),
              SizedBox(
                //height: height * 0.07,
                width: width,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: height * 0.03)),
                  child: Text(
                    'Continue with Apple',
                    style:
                        TextStyle(color: Colors.white, fontSize: height / 50),
                  ),
                ),
              ),
              SizedBox(height: height * .03),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Divider(
                          thickness: height * 0.001,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const Text("     OR     "),
                  Expanded(
                    child: Column(
                      children: [
                        Divider(
                          thickness: height * 0.001,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: height * .03),
              SizedBox(
                //height: height * 0.07,
                width: width * 1,
                child: OutlinedButton(
                  onPressed: () async {
                    context.router.push(const MyRegisterRoute());
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.indigoAccent,
                      padding: EdgeInsets.symmetric(vertical: height * 0.03)),
                  child: Text(
                    'Sign Up',
                    style:
                        TextStyle(color: Colors.white, fontSize: height / 50),
                  ),
                ),
              ),
              SizedBox(height: height * .015),
              SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: height * 0.015,
                          color: Colors.black,
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'By signing up you agree to our '),
                          TextSpan(
                              text: '\nTerms, Privacy Policy, and Cookie Use',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //SizedBox(height: height * .2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Have an account already?',
                    style: TextStyle(fontSize: height * 0.02),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.lightBlue,
                      ),
                      onPressed: () async {
                        context.router.push(const LoginScreen2Route());
                      },
                      child: const Text("LOG IN")),
                ],
              ),
              BlocListener<AppBloc, AppState>(
                listener: (context, state) async {
                  // TODO: HOCAYA SOR, SHARED PREF NEREYE GİDEBİLİR
                  if (state == const AppState.prelanded()) {
                    context.router.replace(const LandingRoute());
                  }
                },
                child: TextButton(
                  onPressed: () {
                    context.read<AppBloc>().add(AppLandedCanceled());
                    print("landed canceled\n\n\n");
                  },
                  child: const Text("Press to cancel landed"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
