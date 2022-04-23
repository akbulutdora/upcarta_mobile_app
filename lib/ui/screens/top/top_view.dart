library top_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/feed_content_list.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';

// import 'package:upcarta_mobile_app/components/content_list.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/src/authentication.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/ui/screens/top/widgets/content_type_picker_chips.dart';
import 'package:upcarta_mobile_app/ui/screens/top/widgets/date_range_picker_chips.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import '../../../util/styles.dart';

part "top_view_header.dart";

final FirebaseAuth _auth = FirebaseAuth.instance;
final List<Content> topContents = <Content>[
  Content(
      title: "TOP SCREEN",
      id: 2,
      contentType: ContentType.book,
      added_by_id: '',
      link: 'www.google.com',
      description: 'berna',
      created_at: '',
      image:
          'https://i.pinimg.com/originals/e8/15/b9/e815b94b7a82d7c6e2f4c791bf984d98.jpg', author_id: ''),
  Content(
      title: "article of idil",
      id: 4,
      contentType: ContentType.article,
      created_at: '',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et do",
      link: 'https://lmgtfy.app/?q=dora+the+explorer',
      added_by_id: '',
      image: 'https://images.gamebanana.com/img/ico/sprays/5c8d6b4f8f5ba.png', author_id: ''),
  Content(
      title: "podcast about game-dev",
      id: 4,
      contentType: ContentType.podcast,
      description: 'it\'s about game dev',
      created_at: '',
      link: 'URL',
      added_by_id: '',
      image: 'https://static-cdn.jtvnw.net/ttv-boxart/105451_IGDB-272x380.jpg', author_id: ''),
];

class TopView extends StatefulWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  State<TopView> createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverAppBar(
            toolbarHeight: 0,
            leading: new Container(),
            automaticallyImplyLeading: false,
            expandedHeight: 400,
            // collapsedHeight: 75,
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: TopViewHeader(),

              // This is where you build the profile part
            ),
          )
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text("Contents", style: sectionStyle),
            ),
            ContentList(
              contentList: topContents,
            ),
          ],
        ),
      ),
    );
  }
}
