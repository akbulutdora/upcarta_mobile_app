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
bool weekly = false;
bool notifEmail = false;
bool updateEmail = false;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            titleSpacing: 0.0,
            title:  Text(
              'Email Settings',
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
                  "Email",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                 Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          )),
                    contentPadding: EdgeInsets.all(height * 0.016),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        )),
                  ),
                ),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                SizedBox(height: height * 0.012),
                 Text(
                  "Connect Accounts",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.all(height * 0.02)),
                        child: Text(
                          'Connect to Twitter',
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 50),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            side:  BorderSide(color: Theme.of(context).primaryColor),
                            padding: EdgeInsets.all(height * 0.02)),
                        child: Text(
                          'Connect to Google',
                          style: TextStyle(
                              color: Theme.of(context).iconTheme.color, fontSize: height / 50),
                        ),
                      ),
                    ]),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                SizedBox(height: height * 0.012),
                 Text(
                  "Discover Email",
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
                 Text(
                  "Discover great books, podcasts, videos, articles, twitter threads, and more, based on your followings.",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Theme.of(context).dividerTheme.color,
                  ),
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Weekly',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    value: weekly,
                    onChanged: (bool value) {
                      setState(() {
                        weekly = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: height * 0.012),
                 Text(
                  "Related to you",
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
                 Text(
                  "Get activity notifications in your inbox.",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Theme.of(context).dividerTheme.color,
                  ),
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title:  Text(
                      'Send notification emails',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    value: notifEmail,
                    onChanged: (bool value) {
                      setState(() {
                        notifEmail = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: height * 0.012),
                 Text(
                  "From Upcarta",
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
                 Text(
                  "Get notified about new features and improvements.",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title: Text(
                      'Send product update emails',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    value: updateEmail,
                    onChanged: (bool value) {
                      setState(() {
                        updateEmail = value;
                      });
                    },
                  ),
                ),
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
