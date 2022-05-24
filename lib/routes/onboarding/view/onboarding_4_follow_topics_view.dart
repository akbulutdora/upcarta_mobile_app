import "package:flutter/material.dart";
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

List<Map> topics = [
  {
    "topic": "Decision Making Topics",
    "choices": [
      "Game Theory",
      "Mental Model",
      "Psychology",
      "Risk",
      "Probability",
      "Persuasion",
      "Negotiation",
      "Strategy"
    ]
  },
  {
    "topic": "Main Topics",
    "choices": [
      "Decision Making",
      "Technology",
      "Psychology",
      "Bitcoin",
      "History",
      "Philosophy",
      "Computer Science",
      "Natural Science"
    ]
  },
  {
    "topic": "Main Topics",
    "choices": [
      "Decision Making",
      "Technology",
      "Psychology",
      "Bitcoin",
      "History",
      "Philosophy",
      "Computer Science",
      "Natural Science"
    ]
  },
  {
    "topic": "Main Topics",
    "choices": [
      "Decision Making",
      "Technology",
      "Psychology",
      "Bitcoin",
      "History",
      "Philosophy",
      "Computer Science",
      "Natural Science"
    ]
  }
];

class UserOnboarding4 extends StatelessWidget {
  const UserOnboarding4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.05, top: height * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Follow 5 or More Topic",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: height * 0.02),
              ),
              const Divider(thickness: 2, color: Colors.blue, height: 10),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
        Expanded(
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: List<Widget>.generate(
                topics.length,
                (index) => Topics(
                    title: topics[index]["topic"],
                    topicList: topics[index]["choices"]),
              )),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, 0), blurRadius: 10, color: Colors.black12)
          ]),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.02, width * 0.05, height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // context.router.push(UserOnboarding3Route());
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Color(0xFF949494), fontSize: 18),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    context.router.push(const HomeRoute());
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Color(0xFF4E89FD), fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Topics extends StatelessWidget {
  const Topics({Key? key, required this.title, required this.topicList})
      : super(key: key);

  final String title;
  final List<String> topicList;

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.transparent,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
            decoration: TextDecoration.underline,
            decorationColor: const Color(0xFF4E89FD),
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 1,
            shadows: [
              Shadow(offset: Offset(0, -height * 0.007), color: Colors.black)
            ],
          ),
        ),
        Container(height: 10),
        Wrap(
            spacing: 10,
            children: List<Widget>.generate(
              topicList.length,
              (int index) => CustomChip(label: topicList[index]),
            )),
        Container(height: 25)
      ],
    );
  }
}

class CustomChip extends StatefulWidget {
  const CustomChip({Key? key, required this.label, this.isSelected = false})
      : super(key: key);

  final String label;
  final bool isSelected;

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  bool isSelected = false;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        selected: isSelected,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.label,
                style: const TextStyle(fontSize: 14, color: Colors.black)),
            const SizedBox(width: 5),
            isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Icon(Icons.add, color: Colors.blue, size: 18)
          ],
        ),
        selectedColor: Colors.blue[100],
        backgroundColor: Colors.white,
        showCheckmark: false,
        side: const BorderSide(width: 0.3, color: Colors.grey),
        onSelected: (val) {
          setState(() {
            isSelected = val;
          });
        });
  }
}
