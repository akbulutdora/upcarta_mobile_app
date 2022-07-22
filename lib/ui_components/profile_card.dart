import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/styles.dart';
import 'follow_button.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override

  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        height: 185.h,
        child: Expanded(
          child: Padding(
            padding:  EdgeInsets.fromLTRB(12.0.w,20.w,12.w,20.w),
            child: Row(
              children: [
                ///Circle Avatar (profile photo)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CircleAvatar(radius: 75/2,),
                    ],
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    children: [
                      /// Name - Follow Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        Text('Naval Ravikant',style: contentCardTitleStyle,),
                        FollowButton(heightt: 45.h, widthh: 85.h,),
                      ],),
                      SizedBox(height: 6.h,),
                      Text('American entrepreneur and investor. He is the co-founder, chairman and former CEO of AngelList.',style: kTextStyle12,),
                      SizedBox(height: 6.h,),
                      Row(
                        children: [
                        Wrap(
                          spacing: 5.h,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text('172'),
                            Icon(Icons.content_paste_outlined, size: 20),
                          ],
                        ),
                        SizedBox(width: 10.h,),
                        Wrap(
                          spacing: 5.h,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text('172'),
                            Icon(Icons.thumb_up, size: 20),
                      ],
                        ),
                    ],
                  ),
                ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


