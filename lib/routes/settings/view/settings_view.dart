import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/app/bloc/theme_cubit.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/routes/login/bloc/login_cubit.dart';

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
        appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0.0,
            title: const Text(
              'Settings',
              style: TextStyle(
                  fontFamily: "SFCompactText-Medium",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
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
                        child: const ListTile(
                            title: Text('Email',
                                style: TextStyle(
                                  fontFamily: "SFCompactText",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                            leading: Icon(
                              Icons.mail,
                              color: Colors.black,
                            )))),
                Card(
                    child: InkWell(
                        onTap: () {
                          context.router.push(const PasswordSettingsRoute());
                        },
                        child: const ListTile(
                            title: Text('Password',
                                style: TextStyle(
                                  fontFamily: "SFCompactText",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                            leading: Icon(
                              Icons.vpn_key,
                              color: Colors.black,
                            )))),
                Card(
                    child: InkWell(
                        onTap: () {
                          context.router
                              .push(const NotificationSettingsRoute());
                        },
                        child: const ListTile(
                            title: Text('Notifications',
                                style: TextStyle(
                                  fontFamily: "SFCompactText",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                            leading: Icon(
                              Icons.notifications,
                              color: Colors.black,
                            )))),
                BlocBuilder<ThemeCubit, ThemeData>(
                  builder: (_, theme) {
                    return Card(
                        child: InkWell(
                      child: SwitchListTile(
                        title: const Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontFamily: "SFCompactText",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value: theme.brightness == Brightness.dark,
                        onChanged: (bool value) {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                        secondary: const Icon(
                          Icons.brightness_2,
                          color: Colors.black,
                        ),
                      ),
                    ));
                  },
                ),
                Card(
                    child: InkWell(
                        onTap: () {},
                        child: const ListTile(
                          title: Text(
                            'Disable Account',
                            style: TextStyle(
                              fontFamily: "SFCompactText",
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black,
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
