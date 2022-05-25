import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class EmailSettings extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: EmailSettings(),
    );
  }

  const EmailSettings({
    Key? key,
  }) : super(key: key);

  @override
  _EmailSettingsState createState() => _EmailSettingsState();
}

class _EmailSettingsState extends State<EmailSettings> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0.0,
            title: const Text(
              'Notifications',
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
                const InkWell(
                  child: ListTile(
                    title: Text(
                      "Notification Preferences",
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),

                const Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: height * 0.012),
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
