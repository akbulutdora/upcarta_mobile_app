import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

import 'follow_button.dart';

class TopicHeader extends StatefulWidget {
  const TopicHeader({Key? key}) : super(key: key);

  @override
  State<TopicHeader> createState() => _TopicHeaderState();
}

class _TopicHeaderState extends State<TopicHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0.w,20.w,10.w,20.w),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Row(
                  children: [
                    Text('# Decision Making',style: topicHeaderTitleStyle.copyWith(color: Theme.of(context).primaryColorDark),),
                  ],
                ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  FollowButton(heightt: 45.h, widthh: 105.h),
                  SizedBox(width: 10,),
                  Wrap(
                    spacing: 5,
                    children: [
                      Text('1.2k',style: kTextStyle12.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark),),
                      Text('Following',style: kTextStyle12.copyWith(color: Theme.of(context).primaryColorDark),),

                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              RichText(
                text: TextSpan(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fermentum, a id nunc, odio augue enim. Viverra nullam pulvinar volutpat ultricies hendrerit sed. Morbi eget a nisi nulla vulputate vestibulum ',
                  style: kTextStyle12.copyWith(color: Theme.of(context).primaryColorDark),
                  children: <TextSpan>[
                    TextSpan(text: 'read more', style: kTextStyle12.copyWith(fontWeight: FontWeight.bold))
                  ]
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
