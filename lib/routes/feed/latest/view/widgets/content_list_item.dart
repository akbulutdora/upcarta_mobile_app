import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/content.dart';
import 'package:upcarta_mobile_app/ui_components/content_card.dart';

class ContentListItem extends StatelessWidget {
  const ContentListItem({Key? key, required this.content}) : super(key: key);

  final Content content;

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      content: content,
    );
    // DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    // final textTheme = Theme.of(context).textTheme;
    // return Material(
    //   child: ListTile(
    //     leading: Text(content.postId, style: textTheme.caption),
    //     title: Text(content.title),
    //     trailing: Text(dateFormat.format((content.createDate))),
    //     isThreeLine: true,
    //     subtitle: Text(content.contentTopic),
    //     dense: true,
    //   ),
    // );
  }
}
