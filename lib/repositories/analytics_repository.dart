import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class AnalyticsRepository {
  AnalyticsRepository({FirebaseAnalytics? firebaseAnalytics})
      : _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics.instance;

  final FirebaseAnalytics _firebaseAnalytics;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);

  setLogEvent(String log) async {
    try {
      await _firebaseAnalytics.logEvent(name: log);
      if (kDebugMode) {
        print(log);
      }
    } catch (err) {
      if (kDebugMode) {
        print('error while setting log event (analytics): $err');
      }
    }
  }

  setCurrentScreen(String screenName) {
    try {
      _firebaseAnalytics.setCurrentScreen(screenName: screenName);
    } catch (err) {
      if (kDebugMode) {
        print('error while setting current screen (analytics): $err');
      }
    }
  }

  setUserId(String userID) async {
    try {
      await _firebaseAnalytics.setUserId(id: userID);
    } catch (err) {
      if (kDebugMode) {
        print('error while setting user id (analytics): $err');
      }
    }
  }

  setDefaultEventParameters(String email) async {
    try {
      await _firebaseAnalytics.setDefaultEventParameters({
        'email': email,
      });
      if (kDebugMode) {
        print(email);
      }
    } catch (err) {
      if (kDebugMode) {
        print('error while setting default parameters (analytics): $err');
      }
    }
  }
}
