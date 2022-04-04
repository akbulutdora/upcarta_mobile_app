import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';

class ContentCard extends StatelessWidget {
  final Content content;

  ContentCard({required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(content.title, style: TextStyle(fontFamily: "SFCompactText",),),
              subtitle: Text('Lorem ipsum dolor sit amet'),
              trailing: Text("Type: " + content.contentType.getString()),
            ),
          ],
        ),
      ),
    );
  }
}
