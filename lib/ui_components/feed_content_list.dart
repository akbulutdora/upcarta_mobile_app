import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'components.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

class FeedContentList extends StatefulWidget {
  final List<Content> contentList;

  const FeedContentList({Key? key, required this.contentList})
      : super(key: key);

  @override
  State<FeedContentList> createState() => _FeedContentListState();
}

class _FeedContentListState extends State<FeedContentList> {
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
                    border: Border.all(color: AppColors.gray2_lightText)),
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
                    const Divider(),
                    ContentCard(content: contents[index]),
                  ],
                ));
          }),
    );
  }
}
