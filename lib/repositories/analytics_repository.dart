import "package:firebase_analytics/firebase_analytics.dart";

class AnalyticsRepository {
  AnalyticsRepository({FirebaseAnalytics? firebaseAnalytics})
      : _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics.instance;

  final FirebaseAnalytics _firebaseAnalytics;

  setLogEvent(String log) async {
    try {
      await _firebaseAnalytics
          .logEvent(name: log, parameters: {"event_name": "Event"});
      print(log);
    } catch (err) {
      print("error while setting log event (analytics): $err");
    }
  }

  setCurrentScreen(String screenName) {
    try {
      _firebaseAnalytics.setCurrentScreen(screenName: screenName);
    } catch (err) {
      print("error while setting current screen (analytics): $err");
    }
  }

  setUserId(String userID) async {
    try {
      await _firebaseAnalytics.setUserId(id: userID);
    } catch (err) {
      print("error while setting user id (analytics): $err");
    }
  }
}
