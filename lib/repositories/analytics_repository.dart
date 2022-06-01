import "package:firebase_analytics/firebase_analytics.dart";

class AnalyticsRepository {
  AnalyticsRepository({FirebaseAnalytics? firebaseAnalytics})
      : _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics.instance;

  final FirebaseAnalytics _firebaseAnalytics;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);

  setLogEvent(String log) async {
    try {
      await _firebaseAnalytics.logEvent(name: log);
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

  setDefaultEventParameters(String email) async {
    try {
      await _firebaseAnalytics.setDefaultEventParameters({
        "email": email,
      });
      print(email);
    } catch (err) {
      print("error while setting default parameters (analytics): $err");
    }
  }
}
