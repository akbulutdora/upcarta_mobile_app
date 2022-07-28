import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/styles.dart';
import 'follow_button.dart';
class FollowCard extends StatefulWidget {
  const FollowCard({Key? key}) : super(key: key);

  @override
  State<FollowCard> createState() => _FollowCardState();
}

class _FollowCardState extends State<FollowCard> {
  @override
  Widget build(BuildContext context) {
   /// Used card in order to get black for text rather than primary blue
    return Card(
      /// in order to remove card borders
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(0),
),
      elevation: 0,
      child: SizedBox(

        child: Expanded(
          child: Padding(
            padding:  EdgeInsets.fromLTRB(12.0.w,20.w,12.w,10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Circle Avatar (profile photo)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CircleAvatar(radius: 65/2,),
                  ],
                ),
                const SizedBox(width: 12,),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Name - Follow Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Naval Ravikant',style: contentCardTitleStyle,),
                                  Text('awdadwadawdadwawdadwadawdadwawdadwadawdadwawdadwadawdadw',
                                    style: TextStyle(
                                      fontFamily: 'SFCompactText',
                                      fontSize: 14.sp,
                                    ),
                                    maxLines: 2,
                                  overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 6,),
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
                              ),
                            ),
                            FollowButton(heightt: 45.h, widthh: 85.h,),
                          ],),




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

class FollowersView extends StatefulWidget {
  const FollowersView({Key? key}) : super(key: key);

  @override
  State<FollowersView> createState() => _FollowersViewState();
}

class _FollowersViewState extends State<FollowersView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FollowCard(),
        FollowCard(),
        FollowCard(),
        FollowCard(),
        FollowCard(),
        FollowCard(),
      ],
    );
  }
}

class FollowerPage extends StatefulWidget {
  const FollowerPage({Key? key}) : super(key: key);

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Followers',
          style: kAppBarTitleTextStyle,
        ),
        elevation: 0.8,
      ),
      body: FollowersView(),
    );
  }
}




