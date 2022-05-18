import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/service/auth_service.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.05),
                    Text("Sign up",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: height / 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: height * 0.025),
                    TextField(
                      controller: _emailController,
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    TextField(
                      controller: _passwordController,
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
                    SizedBox(height: height * 0.28),
                    Container(
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          OutlinedButton(
                            onPressed: () async {
                              _authService
                                  .createPerson(
                                      _nameController.text,
                                      _emailController.text,
                                      _passwordController.text,
                                      _usernameController.text)
                                  .then((value) {
                                // return context.router
                                //     .push(MyRegisterConfirmRoute());
                                return context.router.push(HomeRoute());
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.indigoAccent,
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.03),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold),
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
    );
  }
}
