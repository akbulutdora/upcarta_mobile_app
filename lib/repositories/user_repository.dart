import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/models/content.dart';
import 'package:upcarta_mobile_app/models/collection.dart';

/// {@template user_repository}
/// 5-*Ğlköhyujmg tfnbractions.
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
  Future<void> changePhoto(String newURL) async {
    try {
      _firebaseAuth.currentUser!.updatePhotoURL(newURL);
      _firestoreDB
          .doc(_firebaseAuth.currentUser!.uid)
          .set({"photoURL": newURL});
    }
    // TODO: IMPLEMENT ERROR
    catch (_) {}
  }

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

  ///*********************************************PROFILE*********************************************************
  /// Contents
  Future<List<Map<String,dynamic>>> profileGetCollections() async {
    try{
    var docSnapshot = await _firestoreDB
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid).get();

      if(docSnapshot.exists){
        Map<String,dynamic> data = docSnapshot.data()!;
        var collectionInfo = data['collectionsInfo'];
        return collectionInfo;
      }
      return [];
    } catch  (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return [];
    }
  }

  /// Getting content details
  Future<Map<String,dynamic>> profileGetCollectionsDetail(String collectionId) async {
    try {
      var docSnapshot = await _firestoreDB
          .collection('collections')
          .doc(collectionId).get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        return data;
      }
      return {};
    } catch  (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return {};
    }
  }

  ///Recommends
  //TODO: bu baya kötü geldi bana daha iyi yolu var mı ki, kötü yazdım yani kodu.
  Future<List<dynamic>> profileGetRecommends() async {
    try{
      var docSnapshot = await _firestoreDB
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid).get();

      if(docSnapshot.exists){
        Map<String,dynamic> data = docSnapshot.data()!;
        var recommendationsID = data['recommendationsID'];
        var recommendationSnapshot = await _firestoreDB
            .collection('collections')
            .doc(recommendationsID).get();
        if(recommendationSnapshot.exists){
          var recPostsList = [];
          var postIDs = recommendationSnapshot.data()!['postIDs'];
          for(int i = 0; i < postIDs.length; i++) {
            var recommendationPostSnapshot = await _firestoreDB
                .collection('posts')
                .doc(postIDs[i]).get();
            if(recommendationPostSnapshot.exists){
              recPostsList.add(recommendationPostSnapshot.data()!);
            }
          }
          return recPostsList;
        }
      }
      return [];
    } catch  (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return [];
    }
  }
  ///*********************************************PROFILE*********************************************************

  ///User creates collection (Initialization, only with 1 post and 1 recommender)
  Future<String> setCollection(Collection collection) async {
    try {
      var collectionId = _firestoreDB.collection("collections").add(collection.toJson()).then((documentSnapshot) => documentSnapshot.id);
      return collectionId;
    }
    catch (_) {return "";}
  }

  ///User creates recommendation post
  Future<void> createPost(Content post) async {
    try {
      var postId = _firestoreDB.collection("posts").add(post.toJson()).then((documentSnapshot) => documentSnapshot.id);

      var docSnapshot = await _firestoreDB
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid).get();

      Map<String, dynamic> data = docSnapshot.data()!;
      var recommendationsID = data['recommendationsID'];
      _firestoreDB
          .collection("collections")
          .doc(recommendationsID)
          .update({
        "postIDs": FieldValue.arrayUnion([postId]),
      });
    }
    catch (_) {}
  }
  /// Timeline
  Future getTimeline() async{
    try {
      var docSnapshot = await _firestoreDB
          .collection('timeline')
          .doc(_firebaseAuth.currentUser!.uid).get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        return data;
      }
      return {};
    } catch  (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return {};
    }
  }



}
