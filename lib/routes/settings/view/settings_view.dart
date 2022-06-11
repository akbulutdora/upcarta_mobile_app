import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/app/theme_cubit/theme_cubit.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

class Settings extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: Settings(),
    );
  }

  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    AutoRouter.of(context);
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            titleSpacing: 0.0,
            elevation: 0.4,
            title: const Text(
              'Settings',
              style: TextStyle(
                  fontFamily: "SFCompactText-Medium",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                context.router.pop();
              },
            )),
        //),
        body: Container(
            padding: EdgeInsets.all(height * 0.016),
            child: ListView(
              children: <Widget>[
                Card(
                    child: InkWell(
                        onTap: () {
                          context.router.push(const EmailSettingsRoute());
                        },
                        child: ListTile(
                            title: Text('Email',
                                style: TextStyle(
                                  fontFamily: "SFCompactText",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Theme.of(context).iconTheme.color,
                                )),
                            leading: Icon(
                              Icons.mail,
                              color: Theme.of(context).iconTheme.color,
                            )))),
                Card(
                    child: InkWell(
                        onTap: () {
                          context.router.push(const PasswordSettingsRoute());
                        },
                        child: ListTile(
                            title: Text('Password',
                                style: TextStyle(
                                  fontFamily: "SFCompactText",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Theme.of(context).iconTheme.color,
                                )),
                            leading: Icon(
                              Icons.vpn_key,
                              color: Theme.of(context).iconTheme.color,
                            )))),
                Card(
                    child: InkWell(
                        onTap: () {
                          context.router
                              .push(const NotificationSettingsRoute());
                        },
                        child: ListTile(
                            title: Text('Notifications',
                                style: TextStyle(
                                  fontFamily: "SFCompactText",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Theme.of(context).iconTheme.color,
                                )),
                            leading: Icon(
                              Icons.notifications,
                              color: Theme.of(context).iconTheme.color,
                            )))),
                BlocBuilder<ThemeCubit, ThemeData>(
                  builder: (_, theme) {
                    return Card(
                        child: InkWell(
                      child: SwitchListTile(
                        activeColor: Theme.of(context).primaryColor,
                        title: Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        value: theme.brightness == Brightness.dark,
                        onChanged: (bool value) {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                        secondary: Icon(
                          Icons.brightness_2,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ));
                  },
                ),
                Card(
                    child: InkWell(
                        onTap: () async {
                          try {
                            await FirebaseFirestore.instance
                                .collection("Person")
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .delete();
                            await FirebaseAuth.instance.currentUser!.delete();
                            context.read<AppBloc>().add(AppLogoutRequested());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'requires-recent-login') {
                              print(
                                  'The user must reauthenticate before this operation can be executed.');
                            }
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Delete Account',
                            style: TextStyle(
                              fontFamily: "SFCompactText",
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ))),
                BlocListener<AppBloc, AppState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state.status == AppStatus.unauthenticated) {
                      // FIXME: LOGOUT DOESN'T NAVIGATE HOME
                      // AutoRouter.of(context)
                      //     .replaceAll([const LoginScreenRoute()]);
                      AutoRouter.of(context).pushAndPopUntil(
                          const LoginScreenRoute(),
                          predicate: ((route) => false));
                    }
                  },
                  child: Card(
                    child: InkWell(
                        onTap: () {
                          context.read<AppBloc>().add(AppLogoutRequested());
                        },
                        child: const ListTile(
                            title: Text(
                          'Logout',
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ))),
                  ),
                ),
              ],
            )));
  }
}
