import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/ui/components/content_list.dart';

import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';

class myLibraryCompletedScreen extends StatefulWidget {
  const myLibraryCompletedScreen({Key? key}) : super(key: key);

  @override
  State<myLibraryCompletedScreen> createState() => _myLibraryCompletedScreenState();
}

class _myLibraryCompletedScreenState extends State<myLibraryCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
}
