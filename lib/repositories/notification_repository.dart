import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

enum NotifTypes { follow, reshare }

class NotificationRepository {
  NotificationRepository(
      {FirebaseFirestore? firebaseFirestore,
      firebase_auth.FirebaseAuth? firebaseAuth})
      : _firestoreDB = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final FirebaseFirestore _firestoreDB;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  Future addNotifications(NotifTypes type, String userID) async {
    final String? senderID = _firebaseAuth.currentUser?.uid;
    final DateTime date = DateTime.now();
    // DateTime.utc(
    //     DateTime.now().year, DateTime.now().month, DateTime.now().day);

    final String contentID = uuid.v1();

    String text = '';

    if (type == NotifTypes.follow) {
      text = 'started to follow you';
    }
    if (type == NotifTypes.reshare) {
      text = 'reshared your post';
    }

    final doc =
        await _firestoreDB.collection('notifications').doc(userID).get();

    if (doc.data() == null) {
      await _firestoreDB.collection('notifications').doc(userID).set({
        contentID: {
          'contentID': contentID,
          'senderID': senderID,
          'date': date,
          'text': text,
          'isRead': false,
        }
      });
      return;
    }

    await _firestoreDB.collection('notifications').doc(userID).update({
      contentID: {
        'contentID': contentID,
        'senderID': senderID,
        'date': date,
        'text': text,
        'isRead': false,
      }
    });
  }

  Future _getNotifOwner(String uID) async {
    var user = await _firestoreDB
        .collection('Person')
        .doc(uID)
        .get()
        .then((res) => res.data());

    return {'username': user?['username'], 'image': user?['photoURL']};
  }

  Future getNotifications() async {
    try {
      Map<String, dynamic> notifListRaw = await _firestoreDB
          .collection('notifications')
          .doc(_firebaseAuth.currentUser?.uid)
          .get()
          .then((res) => res.data() ?? {});

      // var user = await _getNotifOwner("02vAvK53kuY02zALUuzR7ARR8mH3");

      // print(notifListRaw);

      List<Notification> notifList = [];

      for (final item in notifListRaw.values) {
        Map<String, dynamic> senderData =
            await _getNotifOwner(item['senderID']);
        item.remove('senderID');
        Map<String, dynamic> notifJson = {
          ...senderData,
          ...item,
          'date': item['date'].toDate().toString()
        };

        notifList.add(Notification.fromJson(notifJson));
      }

      // notifListRaw?.forEach((key, item) async {
      //   Map<String, dynamic> senderData =
      //       await _getNotifOwner(item["senderID"]);
      //   item.remove("senderID");
      //   Map<String, dynamic> notifJson = {
      //     ...senderData,
      //     ...item,
      //     "date": item["date"].toDate().toString()
      //   };

      //   notifList.add(Notification.fromJson(notifJson));

      //   print("list: $notifList");
      // });

      final todayList = notifList.where((item) {
        return DateTime.now().difference(item.date).inDays == 0;
      }).toList();

      final yesterdayList = notifList.where((item) {
        return DateTime.now().difference(item.date).inDays == 1;
      }).toList();

      final earlierList = notifList.where((item) {
        return DateTime.now().difference(item.date).inDays > 1;
      }).toList();

      return {
        'Today': todayList,
        'Yesterday': yesterdayList,
        'Earlier': earlierList
      };
    } catch (e) {
      if (kDebugMode) {
        print('Failed with error code: $e');
      }
      rethrow;
    }
  }

  Future<void> readNotification(String id) async {
    await _firestoreDB
        .collection('notifications')
        .doc(_firebaseAuth.currentUser?.uid)
        .update({'$id.isRead': true});
  }

  Future readAllNotifications() async {
    dynamic list = {};

    await _firestoreDB
        .collection('notifications')
        .doc(_firebaseAuth.currentUser?.uid)
        .get()
        .then((value) {
      value.data()?.forEach((key, value) {
        if (value['isRead'] == false) {
          list = {
            ...list,
            key: {...value, 'isRead': true}
          };
        }
      });
      return list;
    }).then((val) {
      val = Map<String, dynamic>.from(val);
      _firestoreDB
          .collection('notifications')
          .doc(_firebaseAuth.currentUser?.uid)
          .update(val);
    });
    // print(list);
  }
}
