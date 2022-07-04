// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

import 'package:upcarta_mobile_app/util/colors.dart';

class CollectionCard extends StatelessWidget {
  final Content content;

  CollectionCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: AppColors.gray2LightText),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          width: 360.h,
          // padding: const EdgeInsets.fromLTRB(10, 6, 10, 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(content.title, style: contentCardTitleStyle),
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          iconSize: 20,
                          onPressed: () {},
                          icon: Icon(Icons.bookmark),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          iconSize: 20,
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                color: AppColors.gray2LightText,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 55 / 2,
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    // color: Colors.white,
                    // width: 200,
                    // padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Owner',
                            style: kTextStyle10,
                          ),
                          Text(
                            content.description,
                            style: contentCardDescriptionStyle,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          Text(
                            content.url,
                            style: TextStyle(
                                fontFamily: 'SF Compact Text',
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: AppColors.upcartaBlue),
                          )
                        ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
