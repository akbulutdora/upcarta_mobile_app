import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';

import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:upcarta_mobile_app/util/constants.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';

class LibraryCompletedView extends StatefulWidget {
  const LibraryCompletedView({Key? key}) : super(key: key);

  @override
  State<LibraryCompletedView> createState() => _LibraryCompletedViewState();
}

class _LibraryCompletedViewState extends State<LibraryCompletedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
                    cursorHeight: 16,
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
