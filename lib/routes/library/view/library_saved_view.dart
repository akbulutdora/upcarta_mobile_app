import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:upcarta_mobile_app/util/constants.dart';

class MyLibrarySavedScreen extends StatefulWidget {
  const MyLibrarySavedScreen({Key? key}) : super(key: key);

  @override
  State<MyLibrarySavedScreen> createState() => _MyLibrarySavedScreenState();
}

class _MyLibrarySavedScreenState extends State<MyLibrarySavedScreen> {
  late List<String> selectedChips = ['All'];
  bool isAllSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.only(left: 16.0),
          alignment: Alignment.topLeft,
          child: const WrappedSingleChipLibrary(),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  height: 24,
                  width: 185,
                  child: TextFormField(
                    cursorHeight: 18,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 16,
                      ),
                      labelText: 'Search...',
                      labelStyle: searchBarText,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 4.0),
                SizedBox(
                  height: 24.0,
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
                SizedBox(width: 16.0),
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
}
