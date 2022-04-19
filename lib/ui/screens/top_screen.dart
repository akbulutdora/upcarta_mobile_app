import 'package:flutter/cupertino.dart';
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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et do",
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
  int _dateRangeValue = 0;
  int _contentTypeValue = 0;
  List<String> dateRangeNames = ["Week", "Month", "Year", "All"];
  List<Map<String, dynamic>> contentTypeDict = [
    {"name": "All", "icon": Icons.star_border},
    {"name": "Book", "icon": Icons.star_border},
    {"name": "Article", "icon": Icons.star_border},
    {"name": "Tweet", "icon": Icons.star_border},
    {"name": "Video", "icon": Icons.star_border},
    {"name": "Podcast", "icon": Icons.star_border},
  ];

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
              background: collapsingWidget(),

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

  Widget dateRangePickingChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Wrap(
        spacing: 4,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List<Widget>.generate(
          dateRangeNames.length,
          (int index) {
            return ChoiceChip(
              disabledColor: Colors.white,
              selectedColor: AppColors.primary,
              backgroundColor: Colors.white,
              side: BorderSide(color: AppColors.boxFrame),
              label: Text(
                dateRangeNames[index],
                style: TextStyle(
                  color: _dateRangeValue == index ? Colors.white : Colors.black,
                ),
              ),
              selected: _dateRangeValue == index,
              onSelected: (bool selected) {
                setState(() {
                  _dateRangeValue = selected ? index : 0;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }

  contentTypePickingChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Wrap(
        spacing: 4,
        alignment: WrapAlignment.start,
        children: List<Widget>.generate(
          contentTypeDict.length,
          (int index) {
            return ChoiceChip(
              disabledColor: Colors.white,
              selectedColor: AppColors.primary,
              backgroundColor: Colors.white,
              side: BorderSide(color: AppColors.boxFrame),
              avatar: Icon(contentTypeDict[index]["icon"]),
              label: Text(
                contentTypeDict[index]["name"],
                style: TextStyle(
                  color:
                      _contentTypeValue == index ? Colors.white : Colors.black,
                ),
              ),
              selected: _contentTypeValue == index,
              onSelected: (bool selected) {
                setState(() {
                  _contentTypeValue = selected ? index : 0;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }

  Widget collapsingWidget() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            thickness: 1,
          ),
          dateRangePickingChips(),
          contentTypePickingChips(),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Collections and Asks", style: sectionStyle),
                OutlinedButton(
                  style: outlinedButtonStyle,
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                        fontFamily: "SF Compact Text",
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          // CollectionCard(content: topContents[0]),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(0),
              itemCount: topContents.length,
              itemBuilder: (BuildContext context, int index) {
                return CollectionCard(content: topContents[index]);
              },
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
