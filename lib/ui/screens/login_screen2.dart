import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';

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
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
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
              Icon(
                Icons.pause_circle,
                size: 30,
                color: AppColors.primary,
              ),
            ]),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.05),
                      Text("Sign in with email",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height / 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: height * 0.025),
                      TextField(
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
                      SizedBox(height: height * 0.025),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.45),
                      Container(
                        height: height * 0.2,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            OutlinedButton(
                              onPressed: () {context.router.push(OnboardingScreenRoute());},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: Colors.indigoAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.03),
                              ),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: height / 50, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: height * 0.025),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
