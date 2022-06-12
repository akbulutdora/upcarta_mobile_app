import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedBy extends StatelessWidget {
  const RecommendedBy({Key? key, required this.recommenders}) : super(key: key);
  final List<Map<String, String>> recommenders;

  // final List<Map<String, String>> arr = [
  //   {"image": "imageLink", "username": "username 1", "color": "0xFF34E8EB"},
  //   {"image": "imageLink", "username": "username 2", "color": "0xFF20B3E8"},
  //   {"image": "imageLink", "username": "username 3", "color": "0xFF206AE8"},
  //   {"image": "imageLink", "username": "username 4", "color": "0xFF5322E6"},
  // ];

  Map<int, Map<String, dynamic>> createMap(arr) {
    var x = arr.asMap();
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: recommenders.length < 3
                      ? recommenders.length < 2
                          ? 40.w
                          : 55.w
                      : 55.w,
                  height: 20.h,
                ),
                ...createMap(recommenders).entries.map((item) {
                  return item.key < 3
                      ? Positioned(
                          left: item.key * 12,
                          child: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: Color(
                                int.parse(item.value["color"] ?? "0xFF34E8EB")),
                          ),
                        )
                      : Container();
                }).toList(),
              ]),
        ),
        Text(
          "Also recommended by ${recommenders[0]["username"]} ${recommenders.length > 1 ? recommenders.length > 2 ? "and " + (recommenders.length - 1).toString() + " others" : "and " + recommenders[1]["username"]! : ""}",
          style: TextStyle(fontSize: 12.sp),
        )
      ],
    );
  }
}
