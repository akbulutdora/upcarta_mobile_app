import 'package:flutter/material.dart';

import 'package:upcarta_mobile_app/components/feed_content_list.dart';
import 'package:upcarta_mobile_app/components/collection_card.dart';

// import 'package:upcarta_mobile_app/components/content_list.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/src/authentication.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

import '../../util/styles.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final List<Content> topContents = <Content>[
  Content(
      title: "TOP SCREEN",
      id: "2",
      contentType: ContentType.book,
      added_by_id: '',
      link: 'www.google.com',
      description: 'berna',
      created_at: '',
      image:
          'https://i.pinimg.com/originals/e8/15/b9/e815b94b7a82d7c6e2f4c791bf984d98.jpg'),
  Content(
      title: "article of idil",
      id: "3",
      contentType: ContentType.article,
      created_at: '',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      link: 'https://lmgtfy.app/?q=dora+the+explorer',
      added_by_id: '',
      image: 'https://images.gamebanana.com/img/ico/sprays/5c8d6b4f8f5ba.png'),
  Content(
      title: "podcast about game-dev",
      id: "4",
      contentType: ContentType.podcast,
      description: 'it\'s about game dev',
      created_at: '',
      link: 'URL',
      added_by_id: '',
      image: 'https://static-cdn.jtvnw.net/ttv-boxart/105451_IGDB-272x380.jpg'),
];

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  int _value = 0;
  List<String> names = ["Week", "Month", "Year", "All"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Wrap(
              spacing: 4,
              alignment: WrapAlignment.start,
              children: List<Widget>.generate(
                4,
                (int index) {
                  return ChoiceChip(
                    disabledColor: Colors.white,
                    selectedColor: AppColors.primary,
                    backgroundColor: Colors.white,
                    side: BorderSide(color: AppColors.boxFrame),
                    label: Text(
                      names[index],
                      style: TextStyle(
                        color: _value == index ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : 0;
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Collections and Asks", style: sectionStyle),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: topContents.length,
              itemBuilder: (BuildContext context, int index) {
                return CollectionCard(content: topContents[index]);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Contents", style: sectionStyle),
          ),
          ContentList(
            contentList: topContents,
          ),
        ],
      ),
    );
  }
}
