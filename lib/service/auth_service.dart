import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/models/user.dart' as user_model;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid = "";
  String get userId => uid;

  // SIGN IN
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    uid = user.user!.uid;
    return user.user;
  }

  // SIGN OUT
  signOut() async {
    return await _auth.signOut();
  }

  // CREATE USER THROUGH THE FIREBASE AUTH AND FIRESTORE
  Future<User?> createPerson(
      String name, String email, String password, String username) async {
    // CREATE USER THROUGH THE FIREBASE AUTH
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    // CREATE THE INITIALLY EMPTY SAVED COLLECTION FOR THE USER
    String savesID;
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

    // CREATE THE INITIALLY EMPTY RECOMMEDNATIONS COLLECTION FOR THE USER
    String recomID;
    recomID = await _firestore
        .collection("collections")
        .add(recommendationsCollection)
        .then((DocumentReference doc) => doc.id);

    // ADD THE USER TO FIRESTORE
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
    uid = user.user!.uid;
    return user.user;
  }
}
