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
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            titleSpacing: 0.0,
            title:  Text(
              'Notification Settings',
              style: TextStyle(
                  fontFamily: "SFCompactText-Medium",
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            leading: IconButton(
              icon:  Icon(
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
                 Text(
                  "Notification Preferences",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                 Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Pause All',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Theme.of(context).iconTheme.color,
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
                 Divider(
                  color:Theme.of(context).dividerTheme.color,
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Contents',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Theme.of(context).iconTheme.color,
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
                 Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Collections',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Theme.of(context).iconTheme.color,
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
                 Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Asks',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Theme.of(context).iconTheme.color,
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
                 Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Topics',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Theme.of(context).iconTheme.color,
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
                 Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Activities from people you follow',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Theme.of(context).iconTheme.color,
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
                 Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Messages',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Theme.of(context).iconTheme.color,
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
                 Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                SizedBox(height: height * 0.012),
                Container(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Theme.of(context).primaryColor,
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
