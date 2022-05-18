import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/feed_content_list.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class LatestView extends StatefulWidget {
  const LatestView({Key? key}) : super(key: key);

  @override
  State<LatestView> createState() => _LatestViewState();
}

class _LatestViewState extends State<LatestView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
      child: Column(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firestore.collection("postsTest2").get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                var responseList = snapshot.data!.docs;
                Iterable<Content> contents = responseList
                    .map((content) => Content.fromJson(
                        content.data() as Map<String, dynamic>))
                    .toList();
                return ContentList(contentList: contents as List<Content>);
              }

              return const Text("loading");
            },
          ),
        ],
      ),
    );
  }
}
