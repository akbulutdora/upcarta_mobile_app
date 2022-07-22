import 'package:flutter/material.dart';
import '../util/styles.dart';

class FollowButton extends StatelessWidget {
  FollowButton({required this.heightt, required this.widthh});
  final double widthh;
  final double heightt;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightt,
      width: widthh,
      child: TextButton(onPressed: (){},
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight)),
          child: Text('Follow',style: kTextStyle11.copyWith(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 16),)),
    );
  }
}