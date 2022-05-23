import 'package:flutter/material.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';

class myRegisterConfirm extends StatefulWidget {
  const myRegisterConfirm({Key? key}) : super(key: key);

  @override
  _myRegisterConfirmState createState() => _myRegisterConfirmState();
}

class _myRegisterConfirmState extends State<myRegisterConfirm> {
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
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: height * 0.35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: height * 0.05,
                            ),
                            child: Text(
                              'Confirm your email address',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: height / 40),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: Text(
                          'We sent a confirmation email to:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black, fontSize: height / 60),
                        ),
                      ),
                      Text(
                        'email@email.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: height / 60),
                      ),
                      Container(
                        child: Text(
                          'Check your email and click on the confirmation link to continue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black, fontSize: height / 60),
                        ),
                      ),
                    ]),
                SizedBox(height: height * 0.30),
                TextButton(
                  onPressed: () async {
                    context.router.push(const LoginScreenRoute());
                  },
                  child: const Text(
                    "Resend Email",
                    style: TextStyle(color: Colors.black),
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
