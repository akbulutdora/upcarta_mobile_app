import 'package:flutter/material.dart';
import "package:upcarta_mobile_app/models/models.dart" as models;

final DateTime myDate = DateTime.utc(2022, 05, 18);
final DateTime myDate2 = DateTime.utc(2022, 05, 17);
final DateTime myDate3 = DateTime.utc(2022, 05, 16);
final DateTime myDate4 = DateTime.utc(2022, 05, 15);
final DateTime myDate5 = DateTime.utc(2022, 01, 10);

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final models.Notification notif = models.Notification(
        text: "Hello1",
        image: "a",
        username: "Can1",
        contentID: "1",
        date: myDate);
    final models.Notification notif2 = models.Notification(
        text: "Hello2",
        image: "a",
        username: "Can2",
        contentID: "2",
        date: myDate2);
    final models.Notification notif3 = models.Notification(
        text: "Hello3",
        image: "a",
        username: "Can3",
        contentID: "3",
        date: myDate3);
    final models.Notification notif4 = models.Notification(
        text: "Hello4",
        image: "a",
        username: "Can4",
        contentID: "4",
        date: myDate4);
    final models.Notification notif5 = models.Notification(
        text: "Hello5",
        image: "a",
        username: "Can5",
        contentID: "5",
        date: myDate5);

    final myList = [notif, notif2, notif3, notif4, notif5];

    final todayList = myList.where((item) {
      return DateTime.now().difference(item.date).inDays == 0;
    }).toList();
    final yesterdayList = myList.where((item) {
      return DateTime.now().difference(item.date).inDays == 1;
    }).toList();
    final earlierList = myList.where((item) {
      return DateTime.now().difference(item.date).inDays > 1;
    }).toList();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,

            toolbarHeight: 80,
            elevation: 0,
            centerTitle: true,
            title: const Text("Activity",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24))),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              NotificationsGroup(listOfItems: todayList, when: "Today"),
              const SizedBox(height: 40),
              NotificationsGroup(listOfItems: yesterdayList, when: "Yesterday"),
              const SizedBox(height: 40),
              NotificationsGroup(listOfItems: earlierList, when: "Earlier"),
            ]));
  }
}

class NotificationsGroup extends StatelessWidget {
  const NotificationsGroup(
      {Key? key, required this.listOfItems, required this.when})
      : super(key: key);

  final List<models.Notification> listOfItems;
  final String when;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(when,
              style: TextStyle(
                  color: Colors.transparent,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue[400],
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2,
                  shadows: const [
                    Shadow(offset: Offset(0, -5), color: Colors.black)
                  ])),
          const SizedBox(height: 10),
          ...listOfItems.map((item) {
            return Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                        radius: 24, backgroundColor: Colors.blue),
                    Text(" ${item.username}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    Text(" ${item.text}", style: const TextStyle(fontSize: 24)),
                  ],
                ),
                const Divider(thickness: 1),
              ],
            );
          }).toList(),
        ]);
  }
}
