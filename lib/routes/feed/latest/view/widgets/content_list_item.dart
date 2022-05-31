import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/content.dart';

class ContentListItem extends StatelessWidget {
  const ContentListItem({Key? key, required this.content}) : super(key: key);

  final Content content;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text(content.postId, style: textTheme.caption),
        title: Text(content.title),
        isThreeLine: true,
        subtitle: Text(content.contentTopic),
        dense: true,
      ),
    );
  }
}
