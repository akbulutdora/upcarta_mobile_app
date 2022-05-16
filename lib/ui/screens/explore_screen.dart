import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/ui/components/horizontal_content_list.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

class ExploreScreen extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(child: ExploreScreen());
  }

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class Cat {
  String label = "";

  //Icon icon=Icon(Icons.person);
  bool isSelected = false;

  Cat(this.label, this.isSelected); //, this.icon
}

class _ExploreScreenState extends State<ExploreScreen> {
  late User user;
  final List<Cat> _catList = [
    Cat("All", true), //Icon(Icons.format_list_bulleted_rounded)
    Cat("Collections", false), //, Icon(Icons.menu_book)
    Cat("People", false), //, Icon(Icons.videocam_outlined)
    Cat("Topics", false),
    Cat("Asks", false), //, Icon(Icons.podcasts)
    Cat("Contents", false),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            "assets/images/upcarta-logo-small.png",
            width: 30,
            height: 30,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0.0,
          title: const Text(
            'Explore',
            style: TextStyle(
                fontFamily: "SFCompactText-Medium",
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 32, child: buildSearchBar()),
              SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: catChips(),
                ),
              ),
              SizedBox(height: 20),
              HorizontalContentList(),
            ],
          ),
        ));
  }

  Widget buildSearchBar() => const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
          hintText: 'Content, people, topic, collection, or ask',
          hintStyle: TextStyle(
              fontFamily: "SFCompactText-Regular",
              color: Color(0xff949494),
              fontWeight: FontWeight.w400,
              fontSize: 13),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      );



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

