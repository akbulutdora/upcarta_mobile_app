// EGECAN
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

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();

  const LoginScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      child: const LoginScreen(),
    );
  }
}

class _LoginScreen extends State<LoginScreen> {
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
            child: Stack(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              style: TextStyle(
                                  color: Colors.black, fontSize: height / 30),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * .10),
                      Container(
                        height: height * 0.07,
                        width: width,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.lightBlue,
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.03)),
                          child: Text(
                            'Continue with Twitter',
                            style: TextStyle(
                                color: Colors.white, fontSize: height / 50),
                          ),
                        ),
                      ),
                      SizedBox(height: height * .025),
                      Container(
                        height: height * 0.07,
                        width: width,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.03)),
                          child: Text(
                            'Continue with Google',
                            style: TextStyle(
                                color: Colors.black, fontSize: height / 50),
                          ),
                        ),
                      ),
                      SizedBox(height: height * .025),
                      Container(
                        height: height * 0.07,
                        width: width,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.03)),
                          child: Text(
                            'Continue with Apple',
                            style: TextStyle(
                                color: Colors.white, fontSize: height / 50),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: height * .025),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: height * .025),
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
                            Text("     OR     "),
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
                        SizedBox(height: height * .015),
                        Container(
                          height: height * 0.07,
                          width: width * 1,
                          child: OutlinedButton(
                            onPressed: () async {
                              context.router.push(MyRegisterRoute());
                            },
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: Colors.indigoAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.03)),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white, fontSize: height / 50),
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
                                    TextSpan(
                                        text:
                                            'By signing up you agree to our '),
                                    TextSpan(
                                        text:
                                            '\nTerms, Privacy Policy, and Cookie Use',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: height * .2),
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
                                  context.router.push(LoginScreen2Route());
                                },
                                child: Text("LOG IN")),
                          ],
                        ),
                      ],
                    ),
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
