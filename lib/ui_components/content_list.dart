import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'components.dart';

class ContentList extends StatefulWidget {
  final List<Content> contentList;
  const ContentList({Key? key, required this.contentList}) : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  Widget build(BuildContext context) {
    final List<Content> contents = widget.contentList;

    return Expanded(
      child: Align(
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(thickness: 1.5,),
            itemCount: contents.length,
            itemBuilder: (BuildContext context, int index) {
              return ContentCard(content: contents[index]);
            }),
      ),
    );
  }
}
