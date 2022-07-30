import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';


// that was final type, fix if it causes problem
const lHeadingTextStyle =  TextStyle(
  color: AppColors.upcartaBlue,
  fontSize: 20,
  fontWeight: FontWeight.w400,

);
// Recent Popular in Collections and Asks
const kTabBarTextStyle = TextStyle(
    fontFamily: 'SFCompactText-SemiBold.ttf',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    );

const topicHeaderTitleStyle = TextStyle(
  fontFamily: 'SF Compact Text',
  fontWeight: FontWeight.w600,
  fontSize: 22,
);
/// Used inside of search Bars
const kSearchBarTextStyle = TextStyle(
    fontFamily: 'SFCompactText-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 13);
/// Used only in Upcarta Text on the AppBar for register screen
const kAppBarTextStyle = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColors.black);
/// ('Sign Up') text in register_view.dart
/// Used final because of .sp and offset
final kSignUpTextStyle = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    color: Colors.transparent, // Step 2 SEE HERE
    shadows: [
      Shadow(
          offset: Offset(0, -10.sp),
          color: Colors.black)
    ],
    decoration: TextDecoration.underline,
    decorationThickness: 2.sp
);
/// 'Edit Profile' in edit_profile_view.dart
const kAppBarTitleTextStyle = TextStyle(
    fontFamily: 'SFCompactText-Medium',
    fontWeight: FontWeight.w500,
    fontSize: 22,
);
/// 'Credentials' in edit_profile_view.dart | Bold
const kBoldCredentialsTextStyle = TextStyle(
  fontFamily: 'SFCompactText',
  fontWeight: FontWeight.w700,
  fontSize: 20,

);





/// Used for title of Cards on horizontal scroll bar in feed
const contentCardTitleStyle = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    );


/// self explanation
const exploreCardsFont = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.w500,
    fontSize: 17,
);

const kSettingsLines = TextStyle(
    fontFamily: 'SFCompactText',
    fontWeight: FontWeight.w500,
    fontSize: 18,
);



/// used in Horizontal Content List ('Collections and Asks') and Top View ('Contents')
const sectionStyle = TextStyle(
  fontFamily: 'SF Compact Text',
  fontWeight: FontWeight.w600,
  fontSize: 15,
  shadows: [
    Shadow(
      offset: Offset(0, -1),
    )
  ],
);


/// 'Search' text style
const searchBarText = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: Color(0xff949494));

/// 'Sort' text style
const searchButtonText = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: Color(0xff4E89FD));

const libraryTabBar = TextStyle(
  fontFamily: 'SF Compact Text',
  fontWeight: FontWeight.w600,
  fontSize: 16,
);
/// Splash screen title ('Upcarta')
const splashTitleStyle = TextStyle(
  fontFamily: 'SF Compact Text',
  fontWeight: FontWeight.w600,
  fontSize: 40,
);
/// Used in collection card ('Owner')
const kTextStyle12 = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.normal,
    fontSize: 12,
);

/// Error builder content card text when twitter image not found in
const kTextStyle11 = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.normal,
    fontSize: 11,
);
/// Name of the Owner, currently has same color value for dark&light might change later
const contentCardDescriptionStyle = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.w300,
    fontSize: 10,
    );

// TODO: Check if .sm is required if not convert this to const
final kContentCard = TextStyle(
    fontFamily: 'SF Compact Text',
    fontWeight: FontWeight.normal,
    fontSize: 12.sm,
    );
/// Horizontal Content List ('Collections and Asks')
final outlinedButtonStyle = ButtonStyle(
  side: MaterialStateProperty.all(
    const BorderSide(
      color: Color(0xffdedede),
      width: 0.5,
    ),
  ),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
// TODO: ADD OTHER STYLES FOR BUTTONS AND TEXTS
