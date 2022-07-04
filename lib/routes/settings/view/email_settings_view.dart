import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            elevation: 0.8,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            titleSpacing: 0.0,
            title: Text(
              'Email Settings',
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
            padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0.h),
            child: ListView(
              children: <Widget>[
                Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Change your email address.',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Theme.of(context).dividerTheme.color,
                  ),
                ),
                SizedBox(
                  height: 12.h,
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
                SizedBox(height: 40.h),
                Text(
                  'Connect Accounts',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
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
                                borderRadius: BorderRadius.circular(15.r)),
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.fromLTRB(32.w, 8.h, 32.w, 8.h)),
                        child: Text(
                          'Connect to Twitter',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r)),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                            padding: EdgeInsets.fromLTRB(32.w, 8.h, 32.w, 8.h)),
                        child: Text(
                          'Connect to Google',
                          style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontSize: 12.sp),
                        ),
                      ),
                    ]),
                SizedBox(height: 40.h),
                Text(
                  'Discover Email',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                Text(
                  'Discover great books, podcasts, videos, articles, twitter threads, and more, based on your followings.',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                    color: Theme.of(context).dividerTheme.color,
                  ),
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title: Text(
                      'Weekly',
                      style: TextStyle(
                        fontFamily: 'SFCompactText',
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
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
                SizedBox(height: 40.h),
                Text(
                  'Related to you',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                Text(
                  'Get activity notifications in your inbox.',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Theme.of(context).dividerTheme.color,
                  ),
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title: Text(
                      'Send notification emails',
                      style: TextStyle(
                        fontFamily: 'SFCompactText',
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
                SizedBox(height: 40.h),
                Text(
                  'From Upcarta',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                Text(
                  'Get notified about new features and improvements.',
                  style: TextStyle(
                    fontFamily: 'SFCompactText',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Theme.of(context).dividerTheme.color,
                  ),
                ),
                InkWell(
                  child: SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title: Text(
                      'Send product update emails',
                      style: TextStyle(
                        fontFamily: 'SFCompactText',
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
                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.fromLTRB(32.w, 8.h, 32.w, 8.h)),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            )));
  }
}
