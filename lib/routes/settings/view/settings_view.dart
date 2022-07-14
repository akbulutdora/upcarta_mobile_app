import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/app/theme_cubit/theme_cubit.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';


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
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            titleSpacing: 0.0,
            elevation: 0.8,
            title: Text(
              'Settings',
              style: TextStyle(
                  fontFamily: 'SFCompactText-Medium',
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 22.sp),
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
            color: Theme.of(context).appBarTheme.backgroundColor,
            padding: EdgeInsets.all(16.h),
            child: ListView(
              children: <Widget>[
                Card(
                    elevation: 0,
                    child: InkWell(
                        onTap: () {
                          context.router.push(const EmailSettingsRoute());
                        },
                        child: ListTile(
                            title: Text('Email',
                                style: TextStyle(
                                  fontFamily: 'SFCompactText',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Theme.of(context).iconTheme.color,
                                )),
                            leading: Icon(
                              Icons.mail,
                              color: Theme.of(context).iconTheme.color,
                            )))),
                Divider(
                  color: Theme.of(context).dividerColor,
                  height: 2.h,
                ),
                Card(
                    elevation: 0,
                    child: InkWell(
                        onTap: () {
                          context.router.push(const PasswordSettingsRoute());
                        },
                        child: ListTile(
                            title: Text('Password',
                                style: TextStyle(
                                  fontFamily: 'SFCompactText',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Theme.of(context).iconTheme.color,
                                )),
                            leading: Icon(
                              Icons.vpn_key,
                              color: Theme.of(context).iconTheme.color,
                            )))),
                Divider(
                  color: Theme.of(context).dividerColor,
                  height: 2.h,
                ),
                Card(
                    elevation: 0,
                    child: InkWell(
                        onTap: () {
                          context.router
                              .push(const NotificationSettingsRoute());
                        },
                        child: ListTile(
                            title: Text('Notifications',
                                style: TextStyle(
                                  fontFamily: 'SFCompactText',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Theme.of(context).iconTheme.color,
                                )),
                            leading: Icon(
                              Icons.notifications,
                              color: Theme.of(context).iconTheme.color,
                            )))),
                Divider(
                  color: Theme.of(context).hintColor,
                  height: 2.h,
                ),
                BlocBuilder<ThemeCubit, ThemeData>(
                  builder: (_, theme) {
                    return Card(
                        elevation: 0,
                        child: InkWell(
                          child: SwitchListTile(
                            activeColor: Theme.of(context).primaryColor,
                            title: Text(
                              'Dark Mode',
                              style: TextStyle(
                                fontFamily: 'SFCompactText',
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
                Divider(
                  color: Theme.of(context).hintColor,
                  height: 2.h,
                ),
                Card(
                    elevation: 0,
                    child: InkWell(
                        onTap: () async {
                          try {
                            await FirebaseFirestore.instance
                                .collection('Person')
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .delete();
                            await FirebaseAuth.instance.currentUser!.delete();
                            context.read<AppBloc>().add(AppLogoutRequested());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'requires-recent-login') {
                              if (kDebugMode) {
                                print(
                                  'The user must reauthenticate before this operation can be executed.');
                              }
                            }
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Delete Account',
                            style: TextStyle(
                              fontFamily: 'SFCompactText',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ))),
                Divider(
                  color: Theme.of(context).dividerColor,
                  height: 2.h,
                ),
                BlocListener<AppBloc, AppState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state.status == AppStatus.unauthenticated) {
                      // FIXME: LOGOUT DOESN'T NAVIGATE HOME
                      // AutoRouter.of(context)
                      //     .replaceAll([const LoginScreenRoute()]);
                      AutoRouter.of(context).pushAndPopUntil(
                          const LoginScreenRoute(),
                          predicate: (route) => false);
                    }
                  },
                  child: Card(
                    elevation: 0,
                    child: InkWell(
                        onTap: () {
                          context.read<AppBloc>().add(AppLogoutRequested());
                        },
                        child: const ListTile(
                            title: Text(
                          'Logout',
                          style: TextStyle(
                            fontFamily: 'SFCompactText',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ))),
                  ),
                ),
                Divider(
                  color: Theme.of(context).dividerColor,
                  height: 2.h,
                ),
              ],
            )));
  }
}
