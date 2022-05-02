import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/content_card.dart';
import 'package:upcarta_mobile_app/models/models.dart';

import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

class ContentList extends StatefulWidget {
  final List<Content> contentList;

  ContentList({required this.contentList});

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  Widget build(BuildContext context) {
    final List<Content> contents = widget.contentList;

    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          padding: const EdgeInsets.all(8),
          itemCount: contents.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.edgeColor)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 15,
                            color: Color(0xff949494),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Recommended by",
                            style: TextStyle(
                                fontFamily: "SF Compact Text",
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: Color(0xff949494)),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    ContentCard(content: contents[index]),
                  ],
                ));
          }),
    );
  }
}
