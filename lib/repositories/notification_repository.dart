import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:upcarta_mobile_app/models/models.dart';

class NotificationRepository {
  NotificationRepository(
      {FirebaseFirestore? firebaseFirestore,
      firebase_auth.FirebaseAuth? firebaseAuth})
      : _firestoreDB = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final FirebaseFirestore _firestoreDB;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  void log() {
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\n");
    print(_firebaseAuth.currentUser?.uid);
  }

  Future addNotifications(Notification notification) async {
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAA\n\n\n");
    var querySnapshot = await _firestoreDB
        .collection('notifications')
        .doc(_firebaseAuth.currentUser?.uid)
        .update({
      "notificationList": FieldValue.arrayUnion([notification.toJson()])
    });
    print("\n\n\nAFTER QUERYING\n\n\n");
    // print(querySnapshot);
  }

  Future getNotifications() async {
    try {
      print("\n\n\nBEFORE QUERYING\n\n\n");
      List<dynamic> notifListRaw = await _firestoreDB
          .collection('notifications')
          .doc(_firebaseAuth.currentUser?.uid)
          .get()
          .then((documentSnapshot) => documentSnapshot['notificationList']);
      print("\n\n\nAFTER QUERYING\n\n\n");

      List<dynamic> notifList = [];

      notifListRaw.forEach((item) {
        notifList.add(Notification.fromJson(item));
      });

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
        "Today": todayList,
        "Yesterday": yesterdayList,
        "Earlier": earlierList
      };
    } catch (e) {
      print('Failed with error code: $e');
      rethrow;
    }
  }

  Future<void> readNotification(String id) async {
    await _firestoreDB
        .collection('notifications')
        .doc(_firebaseAuth.currentUser?.uid)
        .get()
        .then((value) {
      value.data()!['notificationList'].forEach((item) {
        if (item["contentID"] == id) {
          print(item);
        }
      });
    });
  }

  Future readAllNotifications() async {}
}
