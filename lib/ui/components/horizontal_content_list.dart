import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../../util/styles.dart';
import '../screens/top/top_view.dart';
import 'collection_card.dart';

class HorizontalContentList extends StatelessWidget {
  const HorizontalContentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Collections and Asks", style: sectionStyle),
                OutlinedButton(
                  style: outlinedButtonStyle,
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                        fontFamily: "SF Compact Text",
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          // CollectionCard(content: topContents[0]),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(0),
              itemCount: topContents.length,
              itemBuilder: (BuildContext context, int index) {
                return CollectionCard(content: topContents[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
