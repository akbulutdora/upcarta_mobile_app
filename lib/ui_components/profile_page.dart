import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/ui_components/recommended_by.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'follow_button.dart';
class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10,top: 16),
    child: Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    CircleAvatar(radius: 35, foregroundColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,),
    FollowButton(heightt: 45.h, widthh: 105.h,),
    ],
    ),
    SizedBox(height: 6,),
    Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Person Name',
              style: splashTitleStyle.copyWith(fontSize: 22, color: Theme.of(context).primaryColorDark),),
            Text('@username', style: contentCardDescriptionStyle.copyWith(fontSize: 13, color: Theme.of(context).hintColor),),
        ],),
      ],
    ),
      SizedBox(height: 12 ,),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fermentum, a id nunc, odio augue enim. Viverra nullam pulvinar volutpat ultricies hendrerit sed. Morbi eget a nisi nulla vulputate vestibulum purus sodales. ',
        style: kTextStyle12.copyWith(color: Theme.of(context).primaryColorDark),),
      SizedBox(height: 16,),
      Wrap(
        spacing: 20,
        children: [
          Wrap(
            spacing: 5,
            children: [
              Text('1.2k', style: kTextStyle12.copyWith(
                  fontWeight: FontWeight.bold),),
              Text('Followers', style: kTextStyle12,)
            ],
          ),
          Wrap(
            spacing: 5,
            children: [
              Text('200', style: kTextStyle12.copyWith(
                  fontWeight: FontWeight.bold),),
              Text('Following', style: kTextStyle12,)
            ],
          ),
        ],
      ),
      SizedBox(height: 16,),
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
        ],
    ),
    ),
        ),
    );

  }
  }