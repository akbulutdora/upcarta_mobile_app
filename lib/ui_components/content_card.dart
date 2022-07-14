// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/bloc/latest_feed_bloc.dart';
import 'package:upcarta_mobile_app/util/content_type_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components.dart';
import 'package:upcarta_mobile_app/util/styles.dart';


class ContentCard extends StatefulWidget {
  final Content content;

  ContentCard({Key? key, required this.content}) : super(key: key);

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  final bool isTweet = true;
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {

    return isTweet
        ? Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(color: Theme.of(context).cardColor)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 14.h, 12.w, 14.h),
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
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'SFCompactText',
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            constraints: BoxConstraints.loose(Size(16, 20)),
                            splashRadius: 20.r,
                            iconSize: 20.sm,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                            },
                            icon: Icon(Icons.more_horiz,
                                color: Theme.of(context).iconTheme.color),
                            padding: EdgeInsets.all(0),
                          ),
                          SizedBox(width: 20.h),
                          IconButton(
                            constraints: BoxConstraints.loose(Size(20, 20)),
                            splashRadius: 22.r,
                            iconSize: 22.sm,
                            onPressed: !isSaved
                                ? (() {
                                    context.read<LatestFeedBloc>().add(
                                        LatestFeedEventContentSaved(
                                            widget.content.postId));
                                    setState(
                                            (){
                                          isSaved = ! isSaved;
                                        }
                                    );
                                  })
                                : (() {
                                    context.read<LatestFeedBloc>().add(
                                        LatestFeedEventContentUnsaved(
                                            widget.content.postId));
                                    setState(
                                        (){
                                          isSaved = ! isSaved;
                                        }
                                    );
                                  }),
                            icon: !isSaved
                                ? Icon(Icons.bookmark_border_outlined,
                                    color: Theme.of(context).iconTheme.color)
                                : Icon(Icons.bookmark,
                                    color: Theme.of(context).iconTheme.color),
                            padding: EdgeInsets.all(0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(children: [
                    Icon(
                      contentTypeInfoDict[widget.content.contentType]![0],
                      size: 18.sm,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      contentTypeInfoDict[widget.content.contentType]![1],
                      style: TextStyle(
                          fontFamily: 'SF Compact Text',
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sm,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text('\u00B7', style: TextStyle(fontSize: 18.sp)),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      widget.content.username != ''
                          ? widget.content.username
                          : 'null',
                      style: TextStyle(
                          fontFamily: 'SF Compact Text',
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sm,
                          color: Theme.of(context).iconTheme.color),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text('\u00B7', style: TextStyle(fontSize: 18.sp)),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      DateFormat('EEE, dd/mm, HH:mm')
                          .format(widget.content.createDate),
                      style: TextStyle(
                          fontFamily: 'SF Compact Text',
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sm,
                          color: Theme.of(context).iconTheme.color),
                    ),
                    SizedBox(
                      width: 6.sp,
                    ),
                  ]),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color:  Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          child: Image.network(
                            widget.content.imageLocation,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Container(
                                  color:  Theme.of(context).primaryColor,
                                  padding: EdgeInsets.all(16.sm),
                                  width: 100.w,
                                  height: 80.h,
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
                                    widget.content.recommendationText,
                                    style: contentCardDescriptionStyle,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                  Text(
                                    widget.content.url,
                                    style: TextStyle(
                                        fontFamily: 'SF Compact Text',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                        color: Theme.of(context).primaryColor),
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                        child: Text(
                          '10 recommenders',
                          style: TextStyle(
                              fontFamily: 'SF Compact Text',
                              fontWeight: FontWeight.normal,
                              fontSize: 10.sp,
                              color: Theme.of(context).iconTheme.color),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  RecommendedBy(recommenders: [
                    {
                      'image': 'imageLink',
                      'username': 'person A',
                      'color': '0xFF34E8EB'
                    },
                    {
                      'image': 'imageLink',
                      'username': 'person B',
                      'color': '0xFF20B3E8'
                    },
                    {
                      'image': 'imageLink',
                      'username': 'person C',
                      'color': '0xFF206AE8'
                    },
                    {
                      'image': 'imageLink',
                      'username': 'person D',
                      'color': '0xFF5322E6'
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
