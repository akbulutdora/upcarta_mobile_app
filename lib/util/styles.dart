import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

final lHeadingTextStyle = TextStyle(
  color: AppColors.primary,
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const kAppBarTextStyle = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.black);

const kTextStyle1 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 34,
    color: Colors.black);

const kTextStyle2 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 28,
    color: Colors.black);

const kTextStyle3 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 22,
    color: Colors.black);
const kTextStyle3b = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.black);

const kTextStyle4 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 20,
    color: Colors.black);

const contentCardTitleStyle = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: Colors.black);

const kTextStyle6 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 17,
    color: Colors.black);

const kTextStyle7 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: Colors.black);

const kTextStyle8 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 15,
    color: Colors.black);

const sectionStyle = TextStyle(
  fontFamily: "SF Compact Text",
  fontWeight: FontWeight.w600,
  fontSize: 15,
  shadows: [
    Shadow(
      color: Colors.black,
      offset: Offset(0, -4),
    )
  ],
  color: Colors.transparent,
  decoration: TextDecoration.underline,
  decorationThickness: 2,
  decorationColor: Colors.blue,
  decorationStyle: TextDecorationStyle.solid,
);

const kTextStyle9 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: Colors.black);

const searchBarText = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: Color(0xff949494));

const searchButtonText = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: Color(0xff4E89FD));

const libraryTabBar = TextStyle(
  fontFamily: "SF Compact Text",
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

const splashTitleStyle = TextStyle(
  fontFamily: "SF Compact Text",
  fontWeight: FontWeight.w600,
  fontSize: 40,
);

const kTextStyle10 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Colors.black);

const kTextStyle11 = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.normal,
    fontSize: 11,
    color: Colors.black);

final contentCardDescriptionStyle = TextStyle(
    fontFamily: "SF Compact Text",
    fontWeight: FontWeight.w300,
    fontSize: 10,
    color: AppColors.contentText);

final outlinedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.transparent),
  // padding: MaterialStateProperty.all(
  //   EdgeInsets.symmetric(vertical: 4, horizontal: 4),
  // ),
  side: MaterialStateProperty.all(
    const BorderSide(
      color: Color(0xffdedede),
      width: 0.5,
    ),
  ),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
);
// TODO: ADD OTHER STYLES FOR BUTTONS AND TEXTS
