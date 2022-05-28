import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/models/user.dart';

/// {@template user_repository}
/// 5-*Ğlköhyujmg tfnbractions.
/// {@endtemplate}

class UserRepository {
  UserRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firebaseFirestore,
    required SharedPreferences sharedPreferences,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firestoreDB = firebaseFirestore ?? FirebaseFirestore.instance,
        _sharedPreferences = sharedPreferences;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestoreDB;
  final SharedPreferences _sharedPreferences;

  /// TODO: FIX LISTENER, SHOULD ALSO LISTEN TO AUTH CHANGES
  Stream<User> get user {
    return _firestoreDB
        .collection("Person")
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((event) {
      print("\n\n\n\nEVENT DATA ${event.data()!}\n\n\n");
      final user =
          event.data() == null ? User.empty : User.fromJson(event.data()!);
      _sharedPreferences.setString("user", json.encode(user.toString()));

      return user;
    });
  }

  Future<User> getCurrentUser() async {
    var event = await _firestoreDB
        .collection("Person")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((value) => value.data());

    return User.fromJson(event!);
  }

  /// Called when the user changes their profile description
  Future<void> changeBio(String newBio) async {
    try {
      _firestoreDB
          .collection("Person")
          .doc(_firebaseAuth.currentUser!.uid)
          .update({"bio": newBio});
    } catch (e) {
      print(e);
    }
  }

  /// Called when the user changes their profile picture
  Future<void> changePhoto(String newURL) async {
    try {
      _firebaseAuth.currentUser!.updatePhotoURL(newURL);
      _firestoreDB
          .collection("Person")
          .doc(_firebaseAuth.currentUser!.uid)
          .update({"photoURL": newURL});
    }
    // TODO: IMPLEMENT ERROR
    catch (_) {}
  }

  /// Called when the user changes their username
  FutureOr<void> changeUsername(String newUsername) async {
    try {
      print("\n\n\nHERE ${newUsername}\n\n\n");
      //_firebaseAuth.currentUser!.updateDisplayName(newUsername);
      _firestoreDB
          .collection("Person")
          .doc(_firebaseAuth.currentUser!.uid)
          .update({"username": newUsername});
    }
    // TODO: IMPLEMENT ERROR
    catch (e) {
      print(e.toString());
    }
  }

  /// Called when the user follows another user
  Future<void> followUserWithID(String followID) async {}

  /// Called when the user unfollows another user
  Future<void> unfollowUserWithID(String unfollowID) async {}

  /// Called when the user follows a topic
  Future<void> followTopicWithID(String followID) async {}

  /// Called when the user unfollows a topic
  Future<void> unfollowTopicWithID(String followID) async {}

  /// Called when the user saves a recommendation to one of their collections
  Future<void> saveToCollection(String postID, String collectionID) async {}

  /// Called when the user shares a recommendation
  Future<void> recommendContent(String postID) async {}

  /// Called when the user saves a recommendation
  Future<void> saveContent(String spostID) async {}

  // TODO: Might be moved to auth repo
  /// Called when the user changes their email
  Future<void> changeEmail(String newEmail) async {}

  // TODO: Might be moved to auth repo
  /// Called when the user changes their password
  Future<void> changePassword(String newPassword) async {}
}
