import 'package:flutter/material.dart';

import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
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
                    Text("Recover Your Password",
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
                    SizedBox(height: height * 0.60),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        OutlinedButton(
                          onPressed: () async {
                            context.router.push(const ResetPasswordNewRoute());
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Colors.indigoAccent,
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.03),
                          ),
                          child: Text(
                            'Send Recovery Email',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height / 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
