import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // CREATE CONTENT IN FIRESTORE
  Future<Content?> createContent() async {
    final newContentRef = _firestore.collection("postsTest2").doc();

    Content data = Content(
        title: "Firebase content 2",
        id: newContentRef.id,
        contentType: ContentType.video,
        createDate: DateTime.now(),
        image: "",
        posterID: "posterID",
        link: "www.youtube.com",
        creatorID: "creatorID",
        contentTopic: "contentTopic",
        recommendationText: "Cool video!",
        recommendersIDs: ["recommendersIDs"]);

    newContentRef.set(data.toJson());

    return data;
  }

  // CURRENTLY UNUSED, GET POSTS THROUGH HTTP
  Future<List<Content>> getPosts() async {
    final url = Uri.parse(
        "https://my-json-server.typicode.com/cankrmn/upcarta_test/posts"); // API.allUsers
    final response = await http.get(Uri.https(url.authority, url.path));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseList = jsonDecode(response.body) as List;
      // print(responseList);
      List<Content> contents =
          responseList.map((content) => Content.fromJson(content)).toList();
      // print(contents[0]);
      // print(contents);
      return contents;
    }
    return <Content>[];
  }

  // CREATE A USER WITH GIVEN AUTH CREDENTIALS
  Future<User?> createPerson(user, username, name, email) async {
    String savesID;
    String recomID;

    // CREATE THE INITIALLY EMPTY SAVED COLzzzzz
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

    final thisUser = User(
      id: user.user!.uid,
      username: username,
      email: email,
      name: name,
      bio: "",
      joinDate: DateTime.now().toString(),
      followerIDs: const [],
      followingIDs: const [],
      followers: 0,
      following: 0,
      photoURL:
          "gs://upcarta-77024.appspot.com/Amadeo Modigliani - Ritratto di Paul Guillaume 1916.jpg",
      recommendationCount: 0,
      recommendationsID: recomID,
      savesID: savesID,
      collectionsIDs: const [],
      asksIDs: const [],
    );
    await _firestore
        .collection("Person")
        .doc(user.user!.uid)
        .set(thisUser.toJson());

    return user.user;
  }
}
