import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/models/user.dart' as user_model;
import 'package:uuid/uuid.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(
      String name, String email, String password, String username) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    String savesID;
    String recomID;

    final savedCollection = <String, dynamic>{
      "collectionType": "saved",
      "ownerID": user.user!.uid,
      "description": "",
      "createdDate": DateTime.now(),
      "recommenderIDs": [],
      "postIDs": [],
      "isAsk": false,
      "contentTypes": ""
    };
    savesID = await _firestore
        .collection("collections")
        .add(savedCollection)
        .then((DocumentReference doc) => doc.id);
    print(savesID);
    final recommendationsCollection = <String, dynamic>{
      "collectionType": "recommendation",
      "ownerID": user.user!.uid,
      "description": "",
      "createdDate": DateTime.now(),
      "recommenderIDs": [],
      "postIDs": [],
      "isAsk": false,
      "contentTypes": ""
    };
    recomID = await _firestore
        .collection("collections")
        .add(recommendationsCollection)
        .then((DocumentReference doc) => doc.id);

    final thisUser = user_model.User(
      id: user.user!.uid,
      username: username,
      email: email,
      name: name,
      bio: "",
      joinDate: DateTime.now(),
      followerIDs: [],
      followingIDs: [],
      followers: 0,
      following: 0,
      avatar:
          "gs://upcarta-77024.appspot.com/Amadeo Modigliani - Ritratto di Paul Guillaume 1916.jpg",
      recommendationCount: 0,
      recommendationsID: recomID,
      savesID: savesID,
      collectionsIDs: [],
      asksIDs: [],
    );
    await _firestore
        .collection("Person")
        .doc(user.user!.uid)
        .set(thisUser.toJson());

    return user.user;
  }

  String get userID {
    // var user = await _auth.
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return "-1";
    }
  }
}
