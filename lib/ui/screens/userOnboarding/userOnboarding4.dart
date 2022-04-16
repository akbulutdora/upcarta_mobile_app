import "package:flutter/material.dart";

List<Map> topics = [
  {
    "topic": "Decision Making Topics",
    "choices": ["Game Theory", "Mental Model", "Psychology", "Risk", "Probability", "Persuasion", "Negotiation", "Strategy"]
  },
  {
    "topic": "Main Topics",
    "choices": ["Decision Making", "Technology", "Psychology", "Bitcoin", "History", "Philosophy", "Computer Science", "Natural Science"]
  },
  {
    "topic": "Main Topics",
    "choices": ["Decision Making", "Technology", "Psychology", "Bitcoin", "History", "Philosophy", "Computer Science", "Natural Science"]
  },
  {
    "topic": "Main Topics",
    "choices": ["Decision Making", "Technology", "Psychology", "Bitcoin", "History", "Philosophy", "Computer Science", "Natural Science"]
  }
];

class UserOnboarding4 extends StatelessWidget {
  const UserOnboarding4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 57,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(17, 18, 17, 10),
          child: const Text(
            "Follow Topics",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(thickness: 1, color: Colors.black),
        Expanded(
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: List<Widget>.generate(topics.length, (index) => Topics(title: topics[index]["topic"], topicList: topics[index]["choices"]),)
          ),
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
                        fixedSize: const Size(116, 36),
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

class Topics extends StatelessWidget {
  const Topics({Key? key, required this.title, required this.topicList}) : super(key: key);

  final String title;
  final List<String> topicList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
        Container(height:10),
        Wrap(
            spacing: 10,
            children: List<Widget>.generate(
              topicList.length,
                  (int index) {
                return Chip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(topicList[index]),
                        Icon(Icons.add, color: Colors.blue,)
                      ],
                    ),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 0.3, color: Colors.grey));},)
        ),
        Container(height: 25)
      ],
    );
  }
}

