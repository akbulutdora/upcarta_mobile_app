import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';

class ProfileRecommendationsList extends StatelessWidget {
  const ProfileRecommendationsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseAuth _fireauth = FirebaseAuth.instance;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FutureBuilder<QuerySnapshot>(
          future: _firestore
              .collection("posts")
              .where("uId", isEqualTo: _fireauth.currentUser!.uid)
              .get(),
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
              if (snapshot.data!.docs.isEmpty) {
                return Text("UNFORTUNATELY IT IS EMPTY SIR");
              } else {
                var responseList = snapshot.data!.docs;
                Iterable<Content> contents = responseList
                    .map((content) => Content.fromJson(
                        content.data() as Map<String, dynamic>))
                    .toList();
                print("\n\n\nHERE ${contents}");
                return FeedContentList(contentList: contents as List<Content>);
              }
            }

            return const Text("loading");
          },
        ),
      ],
    );
  }
}
