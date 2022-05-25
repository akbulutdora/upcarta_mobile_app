import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: NotificationSettings(),
    );
  }

  const NotificationSettings({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool darkMode = false;
  bool pauseAll = false;
  bool contents = false;
  bool collections = false;
  bool asks = false;
  bool topics = false;
  bool activity = false;
  bool messages = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0.0,
            title: const Text(
              'Notification Settings',
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
                  "Notification Preferences",
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
                InkWell(
                  child: SwitchListTile(
                    title: const Text(
                      'Pause All',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: pauseAll,
                    onChanged: (bool value) {
                      setState(() {
                        pauseAll = value;
                      });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  child: SwitchListTile(
                    title: const Text(
                      'Contents',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: contents,
                    onChanged: (bool value) {
                      setState(() {
                        contents = value;
                      });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  child: SwitchListTile(
                    title: const Text(
                      'Collections',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: collections,
                    onChanged: (bool value) {
                      setState(() {
                        collections = value;
                      });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  child: SwitchListTile(
                    title: const Text(
                      'Asks',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: asks,
                    onChanged: (bool value) {
                      setState(() {
                        asks = value;
                      });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  child: SwitchListTile(
                    title: const Text(
                      'Topics',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: topics,
                    onChanged: (bool value) {
                      setState(() {
                        topics = value;
                      });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  child: SwitchListTile(
                    title: const Text(
                      'Activities from people you follow',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: activity,
                    onChanged: (bool value) {
                      setState(() {
                        activity = value;
                      });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  child: SwitchListTile(
                    title: const Text(
                      'Messages',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: messages,
                    onChanged: (bool value) {
                      setState(() {
                        messages = value;
                      });
                    },
                  ),
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
