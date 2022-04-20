import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/content_card.dart';
import 'package:upcarta_mobile_app/models/models.dart';

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
            return ContentCard(content: contents[index]);
          }),
    );
  }
}
