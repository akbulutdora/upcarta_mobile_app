import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// {@template user_repository}
/// Repository which manages user actions.
/// {@endtemplate}

class UserRepository {
  UserRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestoreDB = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestoreDB;

  /// Called when the user changes their profile description
  Future<void> changeBio(String newBio) async {
    try {
      _firestoreDB.doc(_firebaseAuth.currentUser!.uid).set({"bio": newBio});
    } catch (_) {}
  }

  /// Called when the user changes their profile picture
  Future<void> changePhoto(String newURL) async {}

  /// Called when the user changes their username
  /// TODO: HOCAYA SOR, DOĞRU MU
  Future<void> changeUsername(String newUsername) async {
    try {
      _firebaseAuth.currentUser!.updateDisplayName(newUsername);
      _firestoreDB
          .doc(_firebaseAuth.currentUser!.uid)
          .set({"username": newUsername});
    }
    // TODO: IMPLEMENT ERROR
    catch (_) {}
  }

  /// Called when the user follows another user
  Future<void> followUserWithID(String followID) async {}

  /// Called when the user unfollows another user
  Future<void> unfollowUserWithID(String unfollowID) async {}

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
