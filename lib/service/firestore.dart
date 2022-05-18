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
}
