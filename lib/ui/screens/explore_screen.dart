import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/ui/components/horizontal_content_list/horizontal_content_list__featured_collections.dart';
import 'package:upcarta_mobile_app/ui/components/horizontal_content_list/horizontal_content_list__inspiring_people.dart';
import 'package:upcarta_mobile_app/ui/components/horizontal_content_list/horizontal_content_list__recent_asks.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

import '../../chips/WrappedSinglChip__Explore.dart';
import '../components/horizontal_content_list/horizontal_content_list__content_archive.dart';
import '../components/horizontal_content_list/horizontal_content_list__popular_topics.dart';

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
    Cat("All", false),
    Cat("Collections", false),
    Cat("People", false),
    Cat("Topics", false),
    Cat("Asks", false),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32, child: buildSearchBar()),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.topLeft,
              child: const WrappedSingleChip(),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: SizedBox(
                height: 490,
                child: Expanded(
                  child: ListView(children: const <Widget>[
                    HorizontalContentList__FeaturedCollection(),
                    HorizontalContentList__InspiringPeople(),
                    HorizontalContentList__Popular_Topics(),
                    HorizontalContentList__RecentAsks(),
                    HorizontalContentList__ContentArchive(),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
        label: SizedBox(
          height: 24,
          child: Text(_catList[i].label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "SFCompactText-Regular",
                  color: _catList[i].isSelected
                      ? AppColors.chip
                      : AppColors.secondary)),
        ),
        //avatar: _catList[i].icon,
        padding: EdgeInsets.all(0.5),
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
    }
    return chips;
  }
}
