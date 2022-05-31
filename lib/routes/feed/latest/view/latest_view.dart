import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/bloc/latest_feed_bloc.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/view/widgets/contents_list.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
      child: BlocProvider(
        create: (_) =>
            LatestFeedBloc(userRepository: context.read<UserRepository>())
              ..add(LatestFeedEventContentFetched()),
        child: const PostsList(),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
    //   child: Column(
    //     children: [
    //       FutureBuilder<QuerySnapshot>(
    //         future: _firestore.collection("posts").get(),
    //         builder:
    //             (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //           if (snapshot.hasError) {
    //             return const Text("Something went wrong");
    //           }

    //           if (!snapshot.hasData) {
    //             return const Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }

    //           if (snapshot.connectionState == ConnectionState.done) {
    //             var responseList = snapshot.data!.docs;
    //             Iterable<Content> contents = responseList
    //                 .map((content) => Content.fromJson(
    //                     content.data() as Map<String, dynamic>))
    //                 .toList();
    //             print("\n\n\nHERE ${contents}");
    //             return FeedContentList(contentList: contents as List<Content>);
    //           }

    //           return const Text("loading");
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
