import 'package:flutter/material.dart';
import "package:upcarta_mobile_app/models/models.dart" as models;
import 'package:upcarta_mobile_app/repositories/notification_repository.dart';

// final models.Notification notif = models.Notification(
//     text: "Hello5",
//     image: "a",
//     username: "Can5",
//     contentID: "5",
//     date: DateTime.utc(2022, 01, 10),
//     isRead: false);

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isAllRead = false;
  final NotificationRepository nRepo = NotificationRepository();

  Map<String, List<dynamic>> notifList = {
    "Today": [],
    "Yesterday": [],
    "Earlier": []
  };

  setAllRead() async {
    await nRepo.readAllNotifications();
    setState(() {});
  }

  Future fetchData() async {
    var list = await nRepo.getNotifications();
    notifList = Map<String, List<dynamic>>.from(list);

    print(list);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          toolbarHeight: 80,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Activity",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  await setAllRead();
                },
                child: const Text(
                  "Mark All As Read",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
        // body: Container());
        body: FutureBuilder(
            future: fetchData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text('Please wait its loading...'));
              } else {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  Map<String, dynamic> notifs =
                      snapshot.data as Map<String, dynamic>;
                  return ListView(children: [
                    NotificationsGroup(
                        listOfItems: notifs["Today"] ?? [],
                        when: "Today",
                        isAllRead: isAllRead,
                        repo: nRepo),
                    NotificationsGroup(
                        listOfItems: notifs["Yesterday"] ?? [],
                        when: "Yesterday",
                        isAllRead: isAllRead,
                        repo: nRepo),
                    NotificationsGroup(
                        listOfItems: notifs["Earlier"],
                        when: "Earlier",
                        isAllRead: isAllRead,
                        repo: nRepo),
                  ]);
                }
              }
            }));
  }
}

class NotificationsGroup extends StatelessWidget {
  const NotificationsGroup(
      {Key? key,
      required this.listOfItems,
      required this.when,
      required this.isAllRead,
      required this.repo})
      : super(key: key);

  final List<dynamic> listOfItems;
  final String when;
  final bool isAllRead;
  final NotificationRepository repo;

  @override
  Widget build(BuildContext context) {
    return listOfItems.isNotEmpty
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(when,
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
                ),
                const SizedBox(height: 10),
                ...listOfItems.map((item) {
                  return NotificationInstance(
                    repo: repo,
                    notificationInstance: item,
                    isAllRead: isAllRead,
                  );
                }).toList(),
                const SizedBox(height: 40),
              ])
        : Container(height: 0);
  }
}

class NotificationInstance extends StatefulWidget {
  NotificationInstance(
      {Key? key,
      required this.notificationInstance,
      required this.isAllRead,
      required this.repo})
      : super(key: key);
  late models.Notification notificationInstance;
  late bool isAllRead;
  late NotificationRepository repo;

  @override
  State<NotificationInstance> createState() => _NotificationInstanceState();
}

class _NotificationInstanceState extends State<NotificationInstance> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.notificationInstance.isRead) {
          setState(() {
            widget.repo.readNotification(widget.notificationInstance.contentID);
            widget.notificationInstance.isRead = true;
          });
        }
      },
      child: Container(
        width: double.maxFinite,
        color:
            widget.notificationInstance.isRead ? Colors.white : Colors.blue[50],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    // backgroundColor: Colors.blue,
                    foregroundImage:
                        NetworkImage(widget.notificationInstance.image),
                  ),
                  Text(" ${widget.notificationInstance.username}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(" ${widget.notificationInstance.text}",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Divider(thickness: 1, height: 0),
          ],
        ),
      ),
    );
  }
}
