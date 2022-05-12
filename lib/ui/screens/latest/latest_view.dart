import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/feed_content_list.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
final List<Content> contents = <Content>[
  Content(
      title: "book written by berna",
      id: 2,
      contentType: ContentType.book,
      added_by_id: '',
      link: 'www.google.com',
      description: 'berna',
      created_at: '',
      image:
          'https://i.pinimg.com/originals/e8/15/b9/e815b94b7a82d7c6e2f4c791bf984d98.jpg',
      author_id: ''),
  Content(
      title: "article of idil",
      id: 3,
      contentType: ContentType.article,
      created_at: '',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      link: 'https://lmgtfy.app/?q=dora+the+explorer',
      added_by_id: '',
      image: 'https://images.gamebanana.com/img/ico/sprays/5c8d6b4f8f5ba.png',
      author_id: ''),
  Content(
      title: "podcast about game-dev",
      id: 4,
      contentType: ContentType.podcast,
      description: 'it\'s about game dev',
      created_at: '',
      link: 'URL',
      added_by_id: '',
      image: 'https://static-cdn.jtvnw.net/ttv-boxart/105451_IGDB-272x380.jpg',
      author_id: ''),
];

class LatestView extends StatefulWidget {
  const LatestView({Key? key}) : super(key: key);

  @override
  State<LatestView> createState() => _LatestViewState();
}

class _LatestViewState extends State<LatestView> {
  @override
  Widget build(BuildContext context) {
    CollectionReference posts =
        FirebaseFirestore.instance.collection('postsTest2');

    getPosts();

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
        child: Column(
          children: [
            const Divider(
              thickness: 1,
            ),
            // FutureBuilder<QuerySnapshot>(
            //   future: posts.get(),
            //   builder: (BuildContext context,
            //       AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.hasError) {
            //       return const Text("Something went wrong");
            //     }

            //     // if (snapshot.hasData) {
            //     //   // && !snapshot.data!.exists) {
            //     //   return const Text("Document does not exist");
            //     // }

            //     if (snapshot.connectionState == ConnectionState.done) {
            //       var responseList = snapshot.data!.docs;
            //       Iterable<Content> contents = responseList
            //           .map((content) => Content.fromJson(
            //               content.data() as Map<String, dynamic>))
            //           .toList();
            //       return ContentList(contentList: contents as List<Content>);
            //     }

            //     return const Text("loading");
            //   },
            // ),
            FutureBuilder<List<Content>>(
                future: getPosts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {}
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List reqContents = snapshot.data!;
                      return ContentList(contentList: snapshot.data!);
                    }
                  }
                  return Text("Waiting");
                }),
          ],
        ),
      ),
    );
  }

  Future<List<Content>> getPosts() async {
    //   const List<Map<String, dynamic>> arr = [
    //     {
    //       "id": 1,
    //       "title":
    //           "title 0title 0title 0title 0title 0title 0title 0title 0title 0title 0title 0",
    //       "description":
    //           "description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1",
    //       "contentType": 3,
    //       "created_at": "2022/01/01",
    //       "image": "https://www.w3schools.com/w3images/lights.jpg",
    //       "link": "link 1",
    //       "added_by_id": "added by id 1",
    //       "author_id": "author id 1"
    //     },
    //     {
    //       "id": 2,
    //       "title":
    //           "title 2title 2title 2title 2title 2title 2title 2title 2title 2title 2title 2",
    //       "description":
    //           "description 2description 2description 2description 2description 2description 2description 2description 2description 2description 2description 2",
    //       "contentType": 6,
    //       "created_at": "2022/01/02",
    //       "image": "https://www.w3schools.com/w3images/lights.jpg",
    //       "link": "link 2",
    //       "added_by_id": "added by id 2",
    //       "author_id": "author id 2"
    //     },
    //     {
    //       "id": 3,
    //       "title":
    //           "title 3title 3title 3title 3title 3title 3title 3title 3title 3title 3title 3",
    //       "description":
    //           "description 3description 3description 3description 3description 3description 3description 3description 3description 3description 3description 3",
    //       "contentType": 2,
    //       "created_at": "2022/01/03",
    //       "image": "https://www.w3schools.com/w3images/lights.jpg",
    //       "link": "link 3",
    //       "added_by_id": "added by id 3",
    //       "author_id": "author id 3"
    //     },
    //     {
    //       "id": 4,
    //       "title":
    //           "title 4title 4title 4title 4title 4title 4title 4title 4title 4title 4title 4",
    //       "description":
    //           "description 4description 4description 4description 4description 4description 4description 4description 4description 4description 4description 4",
    //       "contentType": 4,
    //       "created_at": "2022/01/04",
    //       "image": "https://www.w3schools.com/w3images/lights.jpg",
    //       "link": "link 4",
    //       "added_by_id": "added by id 4",
    //       "author_id": "author id 4"
    //     }
    //   ];
    //   // var responseList = jsonDecode(arr) as List;
    //   // print(responseList);
    //   List<Content> contents =
    //       arr.map((content) => Content.fromJson(content)).toList();
    //   // print(contents[0]);
    //   // print(contents);
    //   return contents;
    // }
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
