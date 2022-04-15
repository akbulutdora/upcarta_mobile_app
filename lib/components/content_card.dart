// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

class ContentCard extends StatelessWidget {
  final Content content;

  ContentCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(content.title),
              Row(children: [
                Icon(Icons.local_movies_outlined),
                Text(
                  content.contentType.getString(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "creator",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "created date",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "genre",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacer(
                  flex: 3,
                ),
              ]),
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              Text(
                                content.link,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
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
                  Text("Recommenders number"),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark),
                        padding: EdgeInsets.all(0),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                        padding: EdgeInsets.all(0),
                      ),
                    ],
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
      ),
    );
  }
}
