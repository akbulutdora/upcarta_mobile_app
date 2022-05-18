import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/ui/components/content_list.dart';

import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';
import 'package:upcarta_mobile_app/util/constants.dart';

class myLibrarySavedScreen extends StatefulWidget {
  const myLibrarySavedScreen({Key? key}) : super(key: key);

  @override
  State<myLibrarySavedScreen> createState() => _myLibrarySavedScreenState();
}

class _myLibrarySavedScreenState extends State<myLibrarySavedScreen> {
  late List<String> selectedChips = ['All'];
  bool isAllSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: catChips(),
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  height: 22,
                  width: 185,
                  child: TextFormField(
                    cursorHeight: 12,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      labelText: 'Search...',
                      labelStyle: searchBarText,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 4.0),
                Container(
                  height: 22.0,
                  child: OutlinedButton(
                    onPressed: () {
                      debugPrint('Received click');
                    },
                    child: const Text('Sort', style: searchButtonText),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.dashboard_outlined),
                SizedBox(width: 6.0),
                Icon(Icons.person_outline_outlined),
                SizedBox(width: 6.0),
                Icon(Icons.tag),
                SizedBox(width: 6.0),
              ],
            ),
          ],
        ),
        const Divider(
          color: Color(0xff949494),
        ),
        ContentList(
          contentList: contents,
        ),
      ],
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
            if (value && !selectedChips.contains(_catList[i].label)) {
              selectedChips.add(_catList[i].label);
            } else if (!value && selectedChips.contains(_catList[i].label)) {
              selectedChips.remove(_catList[i].label);
            }
            _catList[i].isSelected = value;
          });
        },
      );

      chips.add(item);
      chips.add(SizedBox(width: 8.0));
    }
    print(selectedChips);
    return chips;
  }

  final List<Category> _catList = [
    Category("All", true), //Icon(Icons.format_list_bulleted_rounded)
    Category("Contents", false), //, Icon(Icons.menu_book)
    Category("Collections", false), //, Icon(Icons.videocam_outlined)
    Category("Asks", false), //, Icon(Icons.podcasts)
  ];
}
