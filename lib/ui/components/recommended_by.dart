import "package:flutter/material.dart";

class RecommendedBy extends StatelessWidget {
  RecommendedBy({Key? key, required this.recommenders}) : super(key: key);
  final List<Map<String, String>> recommenders;

  // final List<Map<String, String>> arr = [
  //   {"image": "imageLink", "username": "username 1", "color": "0xFF34E8EB"},
  //   {"image": "imageLink", "username": "username 2", "color": "0xFF20B3E8"},
  //   {"image": "imageLink", "username": "username 3", "color": "0xFF206AE8"},
  //   {"image": "imageLink", "username": "username 4", "color": "0xFF5322E6"},
  // ];

  Map<int, Map<String, dynamic>> createMap(arr) {
    var x = arr.asMap();
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: recommenders.length < 3
                      ? recommenders.length < 2
                          ? 40
                          : 55
                      : 70,
                  height: 20,
                ),
                ...createMap(recommenders).entries.map((item) {
                  return item.key < 3
                      ? Positioned(
                          left: item.key * 15,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(
                                int.parse(item.value["color"] ?? "0xFF34E8EB")),
                          ),
                        )
                      : Container();
                }).toList(),
              ]),
        ),
        Container(
          child: Text(
            "Also recommended by ${recommenders[0]["username"]} ${recommenders.length > 1 ? recommenders.length > 2 ? "and " + (recommenders.length - 1).toString() + " others" : "and " + recommenders[1]["username"]! : ""}",
            style: TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }
}
