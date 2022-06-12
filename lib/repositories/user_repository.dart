import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/models/collection.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/models/collection.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/notification_repository.dart';

import '../models/models.dart';

/// {@template user_repository}
/// 5-*Ğlköhyujmg tfnbractions.
/// {@endtemplate}

class UserRepository {
  UserRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firebaseFirestore,
    FirebaseStorage? firebaseStorage,
    required SharedPreferences sharedPreferences,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firestoreDB = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance,
        _sharedPreferences = sharedPreferences;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestoreDB;
  final SharedPreferences _sharedPreferences;
  final String userCollection = "Person";
  final FirebaseStorage _firebaseStorage;

  final NotificationRepository _notifRepo = NotificationRepository();

  final AppUser appUser = AppUser.empty;

  /// TODO: FIX LISTENER, SHOULD ALSO LISTEN TO AUTH CHANGES
  Stream<AppUser> get user {
    return _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((event) {
      final user = event.data() == null
          ? AppUser.empty
          : AppUser.fromJson(event.data()!);

      _sharedPreferences.setString("user", json.encode(user.toString()));

      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [AppUser.empty] if there is no cached user.
  // AppUser get currentUser {
  //   var cachedUser = _sharedPreferences.getString("user");
  //   if (cachedUser == null) {
  //     return AppUser.empty;
  //   }
  //   return AppUser.fromJson(json.decode(cachedUser));
  // }

  Future<AppUser> getCurrentUser() async {
    // return appUser;

    if (_firebaseAuth.currentUser == null) return AppUser.empty;
    var event = await _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .get();
// TODO: NULL
    if (event.exists) {
      var data = event.data()!;

      print("USER REQUESTED ${event.toString()}");
      print("AFTER USER REQUESTED ${AppUser.fromJson(data).toString()}");

      return AppUser.fromJson(data);
    }
    return AppUser.empty;
  }

  /// Called when the user changes their profile description
  Future<void> changeBio(String newBio) async {
    try {
      //if (newBio == "") {
      //  newBio = thisUser.bio!;
      //}
      //else{
      _firestoreDB
          .collection(userCollection)
          .doc(_firebaseAuth.currentUser!.uid)
          .update({"bio": newBio});
      //}
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
    on FirebaseException catch (e) {
      print('ERROR: ${e.code} - ${e.message}');
    } catch (e) {
      print(e.toString());
    }
  }

  /// Called when the user changes their username
  FutureOr<void> changeUsername(String newUsername) async {
    try {
      var thisUser = await getCurrentUser();
      if (newUsername == "") {
        throw ("username cannot be empty");
      } else {
        var usernameSnapshot = await _firestoreDB
            .collection(userCollection)
            .where("username", isEqualTo: newUsername)
            .get();
        if (!usernameSnapshot.docs.isEmpty &&
            thisUser.username != newUsername) {
          throw ("username already in use");
        } else {
          _firestoreDB
              .collection(userCollection)
              .doc(_firebaseAuth.currentUser!.uid)
              .update({"username": newUsername});
        }
      }
    } catch (_) {
      rethrow;
    }
  }

  /// Called when the user follows another user
  Future<void> followUserWithID(String followID) async {
    _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      "followingIDs": FieldValue.arrayUnion([followID]),
    });

    _firestoreDB.collection(userCollection).doc(followID).update({
      "followerIDs": FieldValue.arrayUnion([_firebaseAuth.currentUser!.uid]),
    });

    _notifRepo.addNotifications(NotifTypes.follow, followID);
  }

  /// Called when the user unfollows another user
  Future<void> unfollowUserWithID(String unfollowID) async {
    _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      "followingIDs": FieldValue.arrayRemove([unfollowID]),
    });

    _firestoreDB.collection(userCollection).doc(unfollowID).update({
      "followerIDs": FieldValue.arrayRemove([_firebaseAuth.currentUser!.uid]),
    });
  }

  /// Called when the user follows a topic
  Future<void> followTopicWithID(String followID) async {
    _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      "followedTopicsIDs": FieldValue.arrayUnion([followID]),
    });
  }

  /// Called when the user unfollows a topic
  Future<void> unfollowTopicWithID(String followID) async {
    _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
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
      "recommendersIDs":
          FieldValue.arrayUnion([_firebaseAuth.currentUser!.uid]),
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

  /// Called when the user saves a recommendation
  Future<void> reportContent(String postID) async {
    //Getting the unique savesId from the user collection.
    try {
      var report = <String, dynamic>{
        "reportedID": postID,
        "reporterID": _firebaseAuth.currentUser!.uid,
        "reportType": "content"
      };
      await _firestoreDB.collection("reports").doc().set(report);
    } catch (e) {
      print("REPORT CONTENT ERROR $e");
      rethrow;
    }
  }

  // TODO: Might be moved to auth repo
  /// Called when the user changes their email
  Future<void> changeEmail(String newEmail) async {
    _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .update({"email": newEmail});
  }

  // TODO: Might be moved to auth repo
  /// Called when the user changes their password
  Future<void> changePassword(String newPassword) async {
    try {
      if (newPassword.length < 6) {
        print("weak password");
        throw ("Weak password!");
      } else {
        var currentUser = _firebaseAuth.currentUser;
        currentUser!.updatePassword(newPassword);
        print("CHANGED PASSWORD SUCCESSFULLY");
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<void> deleteAccount(String newPassword) async {
    try {
      var currentUser = _firebaseAuth.currentUser;
      await currentUser!.delete();
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
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
        var collectionSnapshot = await _firestoreDB
            .collection('collections')
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
  Future<Map<String, dynamic>> profileGetCollectionsDetail(
      String collectionId) async {
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
  //TODO: sort posts by date
  //Future<List<Content>>
  Future profileGetRecommends(String uid) async {
    try {
      var docSnapshot = await _firestoreDB.collection(userCollection).doc(uid).get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        var recommendationsID = data['recommendationsID'];
        print(recommendationsID);
        var recommendationSnapshot = await _firestoreDB
            .collection('collections')
            .doc(recommendationsID)
            .get();
        if (recommendationSnapshot.exists) {
          List<Content> recPostsList = [];
          var postIDs = recommendationSnapshot.data()!['postIDs'];
          /*

          var recPostsList = await _firestoreDB
              .collection('posts')
              .where('postID', whereIn:postIDs)
              .get()
              .then((val) => val.docs.map((e)=> e.data()!).toList());
          print("HELELLLLOOOOO" + recPostsList.toString());
*/

          for (int i = 0; i < postIDs.length; i++) {
            var recommendationPostSnapshot =
                await _firestoreDB.collection('posts').doc(postIDs[i]).get();
            if (recommendationPostSnapshot.exists) {
              recPostsList
                  .add(Content.fromJson(recommendationPostSnapshot.data()!));
            }
          }
          if(recPostsList.isEmpty){return;}
          return recPostsList;

        }
      }
      return;
    } catch (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return;
    }
  }

  Future libraryGetSaves() async {
    try {
      var docSnapshot = await _firestoreDB
          .collection(userCollection)
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        var savesID = data['savesID'];


        var savesSnapshot = await _firestoreDB
            .collection('collections')
            .doc(savesID)
            .get();
        if (savesSnapshot.exists) {
          /*
          var recPostsList = await _firestoreDB
              .collection('posts')
              .where('postID', whereIn:postIDs)
              .get()
              .then((val) => val.docs.map((e)=> e.data()!).toList());
          */
          List<Content> recPostsList = [];
          var postIDs = savesSnapshot.data()!['postIDs'];
          for (int i = 0; i < postIDs.length; i++) {
            var savePostSnapshot =
                await _firestoreDB.collection('posts').doc(postIDs[i]).get();
            if (savePostSnapshot.exists) {
              recPostsList
                  .add(Content.fromJson(savePostSnapshot.data()!));
            }
          }
          if(recPostsList.isEmpty){return;}
          return recPostsList;
        }
      }
      return;
    } catch (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return;
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
  Future<void> createContent(String title, String contentURL,String content) async {
    try {
      final newRef = _firestoreDB.collection("posts").doc();
      var postId = newRef.id;

      AppUser thisUser = await getCurrentUser();
      print("IS THERE ERROR BEFORE CONTENT $postId\n\n\n\n");

      Content post = Content(
        title: title,
        url: contentURL,
        uId: _firebaseAuth.currentUser!.uid,
        username: thisUser.name ?? "",
        recommendationText: content,
        contentTopic: '',
        contentType: ContentType.video,
        createDate: DateTime.now(),
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
      var followingIDs=  await _firestoreDB
        .collection(userCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((documentSnapshot) => documentSnapshot['followingIDs']);
      if(followingIDs.toString()=="[]"){return;}

      print("HEYYYYYYYO" + await _firestoreDB.collection("posts").where("uId", whereIn:followingIDs).get().then((value) =>value.docs.map((e) => e['url']).toString()));
      var data1 = await _firestoreDB
          .collection("posts")
          .orderBy("createDate", descending: true)
          .where("uId", whereIn:followingIDs)
          .limit(numberOfPosts + 10)
          .get();
      dynamic data;
      if(data1.docs.isEmpty){return;}
      else{
        data= data1.docs.map((e) => Content.fromJson(e.data())).toList();
          //.then((value) {return value.docs.map((e) => Content.fromJson(e.data())).toList();});

      if (data.length > numberOfPosts) {
        return data.sublist(numberOfPosts);
      } else {
        return;
      }
      // return {};
    }} catch (e) {
      print('Failed with error code: $e');
      rethrow;
    }
  }
}
