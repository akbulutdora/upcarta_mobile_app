// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';

import '../util/colors.dart';
import '../util/styles.dart';

class ContentCard extends StatelessWidget {
  final Content content;

  ContentCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(content.title, style: contentCardTitleStyle),
                Container(
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
            SizedBox(
              height: 2,
            ),
            Row(children: [
              Icon(
                Icons.local_movies_outlined,
                size: 20,
                color: AppColors.primary,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                content.contentType.getString(),
                style: TextStyle(
                    fontFamily: "SF Compact Text",
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: AppColors.primary),
              ),
              SizedBox(
                width: 6,
              ),
              Text("\u00B7"),
              SizedBox(
                width: 6,
              ),
              Text(
                "By creator",
                style: TextStyle(
                    fontFamily: "SF Compact Text",
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: AppColors.secondary),
              ),
              SizedBox(
                width: 6,
              ),
              Text("\u00B7"),
              SizedBox(
                width: 6,
              ),
              Text(
                "created date",
                style: TextStyle(
                    fontFamily: "SF Compact Text",
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: AppColors.secondary),
              ),
              SizedBox(
                width: 6,
              ),
              Text("\u00B7"),
              SizedBox(
                width: 6,
              ),
              Text(
                "genre",
                style: TextStyle(
                    fontFamily: "SF Compact Text",
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: AppColors.secondary),
              ),
            ]),
            SizedBox(
              height: 2,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Image.network(
                      content.image,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Container(
                            padding: EdgeInsets.all(8),
                            width: 100,
                            child: const Text(
                              'Could not find image 😢',
                              style: kTextStyle11,
                            ));
                      },
                      height: 72,
                    ),
                  ),
                  Expanded(
                    child: Container(
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
                    ),
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                  child: Text(
                    "10 recommenders",
                    style: TextStyle(
                        fontFamily: "SF Compact Text",
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                        color: AppColors.secondary),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.account_circle),
                Icon(Icons.account_circle),
                Text("Recommended by")
              ],
            ),
            // ListTile(
            //   title: Text(content.title, style: Theme.of(context).textTheme.bodyText1,),
            //   subtitle: Text('Lorem ipsum dolor sit amet'),
            //   trailing: Text("Type: " + content.contentType.getString()),
            // ),
          ],
        ),
      ),
    );
  }
}
