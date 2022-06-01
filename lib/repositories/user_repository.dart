import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/models/collection.dart';
import 'package:upcarta_mobile_app/models/models.dart';

import '../models/models.dart';

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
  final String userCollection = "Person";


  /// TODO: FIX LISTENER, SHOULD ALSO LISTEN TO AUTH CHANGES
  Stream<User> get user {
    return _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((event) {
      final user =
          event.data() == null ? User.empty : User.fromJson(event.data()!);
      _sharedPreferences.setString("user", json.encode(user.toString()));

      return user;
    });
  }


  Future<User> getCurrentUser() async {
    var event = await _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((value) => value.data());

    return User.fromJson(event!);
  }

  /// Called when the user changes their profile description
  Future<void> changeBio(String newBio) async {
    try {
      _firestoreDB
          .collection(userCollection)
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
          .collection(userCollection)
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
          .collection(userCollection)
          .doc(_firebaseAuth.currentUser!.uid)
          .update({"username": newUsername});
    }
    // TODO: IMPLEMENT ERROR
    catch (e) {
      print(e.toString());
    }
  }

  /// Called when the user follows another user
  Future<void> followUserWithID(String followID) async {
    _firestoreDB.collection(userCollection).doc(_firebaseAuth.currentUser!.uid).update({
      "followingIDs": FieldValue.arrayUnion([followID]),
    });
  }

  /// Called when the user unfollows another user
  Future<void> unfollowUserWithID(String unfollowID) async {
    _firestoreDB.collection(userCollection).doc(_firebaseAuth.currentUser!.uid).update({
      "followingIDs": FieldValue.arrayRemove([unfollowID]),
    });
  }

  /// Called when the user follows a topic
  Future<void> followTopicWithID(String followID) async {
    _firestoreDB.collection(userCollection).doc(_firebaseAuth.currentUser!.uid).update({
      "followedTopicsIDs": FieldValue.arrayUnion([followID]),
    });
  }

  /// Called when the user unfollows a topic
  Future<void> unfollowTopicWithID(String followID) async {
    _firestoreDB.collection(userCollection).doc(_firebaseAuth.currentUser!.uid).update({
      "followedTopicsIDs": FieldValue.arrayRemove([followID]),
    });
  }

  /// Called when the user adds a recommendation to one of their collections
  Future<void> saveToCollection(String postID, String collectionID) async {
    _firestoreDB.collection("collections").doc(collectionID).update({
      "postIDs": FieldValue.arrayUnion([postID]),
    });
  }

  /// Called when the user shares a recommendation
  Future<void> recommendContent(String postID) async {
    var recommendationsID = await _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((documentSnapshot) => documentSnapshot['recommendationsID']);
    _firestoreDB.collection("posts").doc(postID).update({
      "recommendersIDs": FieldValue.arrayUnion([_firebaseAuth.currentUser!.uid]),
    });
    _firestoreDB.collection("collections").doc(recommendationsID).update({
      "postIDs": FieldValue.arrayUnion([postID]),
    });
  }

  /// Called when the user saves a recommendation
  Future<void> saveContent(String postID) async {
    //Getting the unique savesId from the user collection.
    var savesId = await _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((documentSnapshot) => documentSnapshot['savesID']);
    //Adding the new postId in the saves collection of the user.
    _firestoreDB.collection("collections").doc(savesId).update({
      "postIDs": FieldValue.arrayUnion([postID]),
    });
  }

  /// Called when the user unsaves a recommendation
  Future<void> unsaveContent(String postID) async {
    //Getting the unique savesId from the user collection.
    var savesId = await _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((documentSnapshot) => documentSnapshot['savesID']);
    //Removing the new postId in the saves collection of the user.
    _firestoreDB.collection("collections").doc(savesId).update({
      "postIDs": FieldValue.arrayRemove([postID]),
    });
  }

  // TODO: Might be moved to auth repo
  /// Called when the user changes their email
  Future<void> changeEmail(String newEmail) async {
    _firestoreDB.collection(userCollection).doc(_firebaseAuth.currentUser!.uid).update({
        "email": newEmail});
  }

  // TODO: Might be moved to auth repo
  /// Called when the user changes their password
  Future<void> changePassword(String newPassword) async {
    var currentUser = _firebaseAuth.currentUser;
    currentUser!.updatePassword(newPassword).then((_){
      print("Successfully changed password");
    }).catchError((err){
    });
  }

  ///*********************************************PROFILE*********************************************************
  /// Contents.
  Future<List<Map<String, dynamic>>> profileGetCollections() async {
    try {
      dynamic res;
      var collectionIds = await _firestoreDB
          .collection(userCollection)
          .doc(_firebaseAuth.currentUser!.uid)
          .get()
          .then((documentSnapshot) => documentSnapshot['collectionsIDs']);
      for (int i = 0; i < collectionIds.length; i++) {
        var collectionSnapshot = await _firestoreDB.collection('collections')
            .doc(collectionIds[i])
            .get();
        res.add(collectionSnapshot);
      }
      return res;
    } catch (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return [];
    }
  }
  /// Getting content details
  Future<Map<String, dynamic>> profileGetCollectionsDetail(String collectionId) async {
    try {
      var docSnapshot =
          await _firestoreDB.collection('collections').doc(collectionId).get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        return data;
      }
      return {};
    } catch (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return {};
    }
  }

  ///Recommends
  //TODO: bu baya kötü geldi bana daha iyi yolu var mı ki, kötü yazdım yani kodu.
  Future<List<dynamic>> profileGetRecommends() async {
    try {
      var docSnapshot = await _firestoreDB
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        var recommendationsID = data['recommendationsID'];
        var recommendationSnapshot = await _firestoreDB
            .collection('collections')
            .doc(recommendationsID)
            .get();
        if (recommendationSnapshot.exists) {
          var recPostsList = [];
          var postIDs = recommendationSnapshot.data()!['postIDs'];
          for (int i = 0; i < postIDs.length; i++) {
            var recommendationPostSnapshot =
                await _firestoreDB.collection('posts').doc(postIDs[i]).get();
            if (recommendationPostSnapshot.exists) {
              recPostsList.add(recommendationPostSnapshot.data()!);
            }
          }
          return recPostsList;
        }
      }
      return [];
    } catch (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return [];
    }
  }

  ///*********************************************PROFILE*********************************************************

  ///User creates collection (Initialization, only with 1 post and 1 recommender)
  Future<String> setCollection(Collection collection) async {
    try {
      var collectionId = _firestoreDB
          .collection("collections")
          .add(collection.toJson())
          .then((documentSnapshot) => documentSnapshot.id);
      return collectionId;
    } catch (_) {
      return "";
    }
  }

  ///User creates recommendation post
  Future<void> createContent(String title, String contentURL) async {
    try {
      final newRef = _firestoreDB.collection("posts").doc();
      var postId = newRef.id;

      print("IS THERE ERROR BEFORE CONTENT ${postId}\n\n\n\n");

      Content post = Content(
        title: title,
        url: contentURL,
        uId: _firebaseAuth.currentUser!.uid,
        username: _firebaseAuth.currentUser!.displayName ?? "",
        recommendationText: "",
        contentTopic: '',
        contentType: ContentType.video,
        createDate: DateTime.now().toString(),
        imageLocation: '',
        postId: postId,
        recommendersIDs: [_firebaseAuth.currentUser!.uid],
      );
      print("IS THERE ERROR BEFORE SET POST ${post.toJson()}\n\n\n\n");

      newRef.set(post.toJson());

      print(
          "IS THERE ERROR BEFORE REACHING TO BBGISUS ACCOUNT ${_firebaseAuth.currentUser!.uid}\n\n\n\n");

      var docSnapshot = await _firestoreDB
          .collection('Person')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      print("IS THERE ERROR AFTER REACHING TO BBGISUS ACCOUNT\n\n\n\n");

      Map<String, dynamic> data = docSnapshot.data()!;

      print("IS THERE ERROR AFTER GETTING DATA\n\n\n\n");

      var recommendationsID = data['recommendationsID'];

      print("IS THERE ERROR AFTER GETTING RECS ID\n\n\n\n");

      _firestoreDB.collection("collections").doc(recommendationsID).update({
        "postIDs": FieldValue.arrayUnion([postId]),
      });

      print("IS THERE ERROR AFTER UNIFY ARRAY\n\n\n\n");
    } catch (e) {
      print("THE ERROR $e");
      rethrow;
    }
  }

  /// Timeline
  /// TODO: SHOULD FETCH 20 POSTS AT A TIME AS IN THIS EXAMPLE https://bloclibrary.dev/#/flutterinfinitelisttutorial
  Future getTimeline() async {
    try {
      var docSnapshot = await _firestoreDB
          .collection('timeline')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        return data;
      }
      return {};
    } catch (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return {};
    }
  }

  /// TODO: FETCH A CERTAIN NUMBER OF POSTS FROM COLLECTION "posts"
  Future fetchPosts({int numberOfPosts = 0}) async {
    try {
      var data = await _firestoreDB.collection("posts").get().then((value) {
        return value.docs.map((e) => Content.fromJson(e.data())).toList();
      });

      // var docSnapshot = await _firestoreDB
      //     .collection('posts')
      //     .doc(_firebaseAuth.currentUser!.uid)
      //     .get();
      // if (docSnapshot.) {
      //   Map<String, dynamic> data = docSnapshot.data()!;
      //   return data;
      // }
      return data;
      // return {};
    } catch (e) {
      print('Failed with error code: $e');
      rethrow;
    }
  }
}
