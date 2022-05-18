// BENGİSU

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/ui/components/content_list.dart';
import 'package:upcarta_mobile_app/ui/screens/myLibrary/libraryCollectionsScreen.dart';
import 'package:upcarta_mobile_app/ui/screens/myLibrary/librarySavedScreen.dart';
import 'package:upcarta_mobile_app/ui/screens/myLibrary/myLibraryCompletedScreen.dart';
import 'package:upcarta_mobile_app/ui/screens/myLibrary/myLibraryRecommendsScreen.dart';

import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:upcarta_mobile_app/util/constants.dart';

//void main() => runApp(const MyLibraryScreen());

class MyLibraryScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: MyLibraryScreen(),
    );
  }

  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class Category {
  String label = "";

  //Icon icon=Icon(Icons.person);
  bool isSelected = false;

  Category(this.label, this.isSelected); //, this.icon
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  bool selected = false;
  final List<Category> _catList = [
    Category("All", true), //Icon(Icons.format_list_bulleted_rounded)
    Category("Contents", false), //, Icon(Icons.menu_book)
    Category("Collections", false), //, Icon(Icons.videocam_outlined)
    Category("Asks", false), //, Icon(Icons.podcasts)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          title: const Text(
            'Your Library',
            style: TextStyle(
                fontFamily: "SFCompactText-Medium",
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22),
          ),
          leading: Image.asset(
            "assets/images/upcarta-logo-small.png",
            width: 30,
            height: 30,
          ),
          elevation: 0,
          //titleTextStyle: libraryTabBar,
          bottom: const TabBar(
            indicatorWeight: 2.25,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
            indicatorPadding: EdgeInsets.all(0),
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'Saved'),
              Tab(text: 'Completed'),
              Tab(text: 'Collections'),
              Tab(text: 'Recommends'),
            ],
            unselectedLabelColor: Color(0xffC4C4C4),
            unselectedLabelStyle: TextStyle(
                fontFamily: 'SFCompactText-SemiBold.ttf',
                fontSize: 17,
                fontWeight: FontWeight.w500),
            labelColor: Color(0xff4E89FD),
            labelStyle: TextStyle(
                fontFamily: 'SFCompactText-SemiBold.ttf',
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            myLibrarySavedScreen(),
            myLibraryCompletedScreen(),
            myLibraryCollectionsScreen(),
            myLibraryRecommendsScreen(),
          ],
        ),
      ),
    );
  }

  List<Widget> catChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _catList.length; i++) {
      Widget item = FilterChip(
        label: Text(_catList[i].label,
            style: TextStyle(
                color: _catList[i].isSelected
                    ? AppColors.chip
                    : AppColors.secondary)),
        //avatar: _catList[i].icon,
        labelStyle: kTextStyle9,
        backgroundColor: Colors.transparent,
        shape: StadiumBorder(side: BorderSide(color: Color(0xffDEDEDE))),
        disabledColor: AppColors.chip,
        selectedColor: AppColors.selected,
        showCheckmark: false,
        selected: _catList[i].isSelected,
        onSelected: (bool value) {
          setState(() {
            _catList[i].isSelected = value;
          });
        },
      );
      chips.add(item);
      chips.add(SizedBox(width: 8.0));
    }
    return chips;
  }
}
