import "package:flutter/material.dart";

class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

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

class UserOnboarding3 extends StatelessWidget {
  const UserOnboarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 57,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(17, 18, 17, 10),
          child: const Text(
            "Follow 5 (or more) People",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(thickness: 1, color: Colors.black),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const Person();
            },),
        ),
        SizedBox(
          height: 101,
          child: Column(
            children: [
              const Divider(thickness: 1, color: Colors.black, height: 0),
              Padding(
                padding: const EdgeInsets.only(right: 33.5, top: 10, left: 33.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        print("Back");
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF667080),
                            fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Next");
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(116, 36),
                        primary: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
