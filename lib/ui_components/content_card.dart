// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/bloc/latest_feed_bloc.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/view/widgets/contents_list.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';
import 'package:upcarta_mobile_app/util/content_type_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

class ContentCard extends StatefulWidget {
  final Content content;

  ContentCard({Key? key, required this.content}) : super(key: key);

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  final bool isTweet = true;

  var _selected = "";

  @override
  Widget build(BuildContext context) {
    return isTweet
        ? Card(
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
                      Flexible(
                        child: Text(
                          widget.content.title,
                          style: contentCardTitleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            constraints: BoxConstraints.loose(Size(20, 20)),
                            splashRadius: 20,
                            iconSize: 20,
                            onPressed: () {
                              context.read<LatestFeedBloc>().add(
                                  LatestFeedEventContentSaved(
                                      widget.content.postId));
                            },
                            icon: Icon(Icons.bookmark),
                            padding: EdgeInsets.all(0),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            constraints: BoxConstraints.loose(Size(20, 20)),
                            splashRadius: 20,
                            iconSize: 20,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              _selected = await showDialog(
                                context: context,
                                builder: (_) {
                                  return SimpleDialog(
                                    title: Text('Post actions'),
                                    children: [
                                      SimpleDialogOption(
                                        child: const Text(
                                            'Add content to collection'),
                                        onPressed: () {
                                          Navigator.pop(
                                              context, "Add to collection");
                                        },
                                      ),
                                      SimpleDialogOption(
                                        child: const Text('Report content'),
                                        onPressed: () {
                                          context.read<LatestFeedBloc>().add(
                                              LatestFeedEventContentReported(
                                                  widget.content.postId));
                                          Navigator.pop(
                                              context, "Report content");
                                        },
                                      ),
                                      SimpleDialogOption(
                                        child: const Text('Report user'),
                                        onPressed: () {
                                          Navigator.pop(context, "Report user");
                                        },
                                      ),
                                    ],
                                    elevation: 10,
                                    //backgroundColor: Colors.green,
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.more_horiz),
                            padding: EdgeInsets.all(0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(children: [
                    Icon(
                      contentTypeInfoDict[widget.content.contentType]![0],
                      size: 20,
                      color: AppColors.upcartaBlue,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      contentTypeInfoDict[widget.content.contentType]![1],
                      style: TextStyle(
                          fontFamily: "SF Compact Text",
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: AppColors.upcartaBlue),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("\u00B7"),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      widget.content.username != ""
                          ? widget.content.username
                          : "null",
                      style: TextStyle(
                          fontFamily: "SF Compact Text",
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: AppColors.black),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("\u00B7"),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      DateFormat('EEE, dd/mm, HH:mm')
                          .format(widget.content.createDate),
                      style: TextStyle(
                          fontFamily: "SF Compact Text",
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: AppColors.black),
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
                          color: AppColors.black),
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
                            widget.content.imageLocation,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Container(
                                  color: Colors.grey.shade100,
                                  padding: EdgeInsets.all(16),
                                  width: 100,
                                  height: 80,
                                  child: Center(
                                    child: const Text(
                                      'Could not find the image 😢',
                                      style: kTextStyle11,
                                    ),
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
                                    widget.content.description,
                                    style: contentCardDescriptionStyle,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                  Text(
                                    widget.content.url,
                                    style: TextStyle(
                                        fontFamily: "SF Compact Text",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                        color: AppColors.upcartaBlue),
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
                              color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                  RecommendedBy(recommenders: [
                    {
                      "image": "imageLink",
                      "username": "person A",
                      "color": "0xFF34E8EB"
                    },
                    {
                      "image": "imageLink",
                      "username": "person B",
                      "color": "0xFF20B3E8"
                    },
                    {
                      "image": "imageLink",
                      "username": "person C",
                      "color": "0xFF206AE8"
                    },
                    {
                      "image": "imageLink",
                      "username": "person D",
                      "color": "0xFF5322E6"
                    },
                  ]),
                  // ListTile(
                  //   title: Text(content.title, style: Theme.of(context).textTheme.bodyText1,),
                  //   subtitle: Text('Lorem ipsum dolor sit amet'),
                  //   trailing: Text("Type: " + content.contentType.getString()),
                  // ),
                ],
              ),
            ),
          )
        : Container();
  }
}
