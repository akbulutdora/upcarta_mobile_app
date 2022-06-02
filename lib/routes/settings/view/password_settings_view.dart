import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PasswordSettings extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: PasswordSettings(),
    );
  }

  const PasswordSettings({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordSettingsState createState() => _PasswordSettingsState();
}

class _PasswordSettingsState extends State<PasswordSettings> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            titleSpacing: 0.0,
            title: const Text(
              'Password Settings',
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
                const Text(
                  "Change Password",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: height * 0.012),
                const Text(
                  "Current Password",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.012),
                TextField(
                  decoration: InputDecoration(
                    labelText: '******',
                    fillColor: Colors.transparent,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.all(height * 0.016),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(height: height * 0.020),
                const Text(
                  "New Password",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.012),
                TextField(
                  decoration: InputDecoration(
                    labelText: '******',
                    fillColor: Colors.transparent,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.all(height * 0.016),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(height: height * 0.020),
                const Text(
                  "Confirm New Password",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.012),
                TextField(
                  decoration: InputDecoration(
                    labelText: '******',
                    fillColor: Colors.transparent,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.all(height * 0.016),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(height: height * 0.020),
                Container(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.lightBlue,
                        padding: EdgeInsets.all(height * 0.02)),
                    child: Text(
                      'Save',
                      style:
                          TextStyle(color: Colors.white, fontSize: height / 50),
                    ),
                  ),
                ),
              ],
            )));
  }
}
