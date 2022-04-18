// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/components/circle_image.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

import '../util/colors.dart';
import '../util/styles.dart';

class CollectionCard extends StatelessWidget {
  final Content content;

  CollectionCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(color: AppColors.edgeColor),
      ),
      child: Container(
        height: 130,
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(content.title, style: contentCardTitleStyle),
                SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 20,
                        onPressed: () {},
                        icon: Icon(Icons.bookmark),
                        padding: EdgeInsets.all(0),
                      ),
                      IconButton(
                        iconSize: 20,
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                        padding: EdgeInsets.all(0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4,),
            Divider(color: Colors.red, thickness: 100,),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: [
                  CircleAvatar(radius: 55,),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content.description,
                            style: contentCardDescriptionStyle,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          Text(
                            content.link,
                            style: TextStyle(
                                fontFamily: "SF Compact Text",
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: AppColors.primary),
                          )
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
