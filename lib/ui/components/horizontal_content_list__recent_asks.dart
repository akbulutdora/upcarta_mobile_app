import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../../util/styles.dart';
import '../screens/top/top_view.dart';
import 'collection_card.dart';

class HorizontalContentList__RecentAsks extends StatelessWidget {
  const HorizontalContentList__RecentAsks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Asks", style: sectionStyle),
                SizedBox(
                  height: 25,
                  width: 70,
                  child: OutlinedButton(
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
                ),
              ],
            ),
          ),
          // CollectionCard(content: topContents[0]),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 16),
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
