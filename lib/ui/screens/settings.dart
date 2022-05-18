import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/ui/components/circle_image.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';

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
                        onTap: () {},
                        child: const ListTile(
                            title: Text('Change Email',
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
                        onTap: () {},
                        child: const ListTile(
                            title: Text('Change Password',
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
                          context.router.push(const NotificationSettingsRoute());
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
                Card(
                    child: InkWell(
                  child: SwitchListTile(
                    title: const Text('Dark Mode',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black,
                      ),),
                    value: darkMode,
                    onChanged: (bool value) {
                      setState(() {
                        darkMode = value;
                      });
                    },
                    secondary: const Icon(
                      Icons.brightness_2,
                      color: Colors.black,
                    ),
                  ),
                )),
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
                Card(
                  child: InkWell(
                      onTap: () {},
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
              ],
            )));
  }
}
