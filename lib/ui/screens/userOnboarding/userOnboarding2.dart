import "package:flutter/material.dart";

class UserOnboarding2 extends StatelessWidget {
  const UserOnboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    late int suggestionNumber = 128;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.05, top: height * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Follow People From Your Twitter", style: TextStyle(fontWeight: FontWeight.w500, fontSize: height * 0.02),),
              const Divider(thickness: 2, color: Colors.blue, height: 10),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Text("Select All $suggestionNumber Matches", style: TextStyle(fontSize: height * 0.016),),
                  // TODO: radio button
                ],
              ),
            ],
          ),
        ),
        FollowWithRadio(),
      ],
    );
  }
}

class FollowWithRadio extends StatelessWidget {
  const FollowWithRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                      ),
                      Text("Person A", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),

                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("pressed");
                  },
                  child: const Text(
                    "Follow",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 36),
                    primary: Colors.blue,
                  ),
                ),
              ],
            ),
            const Text("Neque nisl quam arcu elementum eu nibh.", style: TextStyle(color: Colors.grey, fontSize: 14))
          ],
        ),
      ),
    );
  }
}
