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
  // void setAllRead() {
  //   setState(() {
  //     for (var notif in myList) {
  //       if (!notif.isRead) {
  //         notif.isRead = true;
  //       }
  //     }
  //   });
  // }
  Map<String, List<Notification>> notifList = {
    "Today": [],
    "Yesterday": [],
    "Earlier": []
  };

  Future fetchData() async {
    return await nRepo.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          toolbarHeight: 80,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Activity",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 24),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  // setAllRead();
                },
                child: const Text(
                  "Mark All As Read",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
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
        setState(() {
          widget.repo.readNotification(widget.notificationInstance.contentID);
          widget.notificationInstance.isRead = true;
        });
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
                  const CircleAvatar(radius: 24, backgroundColor: Colors.blue),
                  Text(" ${widget.notificationInstance.username}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24)),
                  Text(" ${widget.notificationInstance.text}",
                      style: const TextStyle(fontSize: 24)),
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
