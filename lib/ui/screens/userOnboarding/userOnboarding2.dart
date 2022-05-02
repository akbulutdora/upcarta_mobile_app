import "package:flutter/material.dart";
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:math';

List<Map> users = [
  {"fullName": "Person A", "userName": "persona"},
  {"fullName": "Person B", "userName": "personb"},
  {"fullName": "Person C", "userName": "personc"},
  {"fullName": "Person D", "userName": "persond"},
  {"fullName": "Person E", "userName": "persone"},
  {"fullName": "Person F", "userName": "personf"},
  {"fullName": "Person G", "userName": "persong"},
  {"fullName": "Person H", "userName": "personh"},
  {"fullName": "Person I", "userName": "personi"},
];

class UserOnboarding2 extends StatelessWidget {
  const UserOnboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    late int suggestionNumber = 128;
    bool isAllSelected = false;
    List<String> selectedUsers = [];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.05, top: height * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Follow People From Your Twitter",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: height * 0.02),
              ),
              const Divider(thickness: 2, color: Colors.blue, height: 10),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Text(
                    "Select All $suggestionNumber Matches",
                    style: TextStyle(fontSize: height * 0.016),
                  ),
                  const SizedBox(width: 12),
                  CustomRadioButton(
                    selected: () {
                      print("Add all");
                    },
                    deselected: () {
                      // selectedUsers = [];
                      print("Remove All");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView(
              children: List<Widget>.generate(
                users.length,
                (index) => FollowWithRadio(
                  fullName: users[index]["fullName"],
                  userName: users[index]["userName"],
                  onSelect: () {
                    selectedUsers.add(users[index]["fullName"]);
                  },
                  onDeselect: () {
                    selectedUsers.removeWhere(
                        (element) => element == users[index]["fullName"]);
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
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
                  print(selectedUsers);
                  context.router.push(const UserOnboarding3Route());
                },
                child: const Text(
                  "Next",
                  style: TextStyle(color: Color(0xFF4E89FD), fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FollowWithRadio extends StatelessWidget {
  const FollowWithRadio(
      {Key? key,
      required this.fullName,
      required this.userName,
      required this.onSelect,
      required this.onDeselect})
      : super(key: key);

  final String fullName;
  final String userName;
  final VoidCallback onSelect;
  final VoidCallback onDeselect;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.03),
          border: Border.all(color: const Color(0xFFC4C4C4), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: min(32, width * 0.08),
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fullName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text("@$userName",
                            style: const TextStyle(
                                color: Color(0xFF949494), fontSize: 16))
                      ],
                    ),
                  ],
                ),
              ),
              CustomRadioButton(
                radius: 12,
                selected: onSelect,
                deselected: onDeselect,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void foo() {}

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton(
      {Key? key,
      this.radius = 10,
      required this.selected,
      required this.deselected})
      : super(key: key);

  final bool isSelected = false;
  final double radius;

  final VoidCallback selected;
  final VoidCallback deselected;

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          isSelected ? widget.selected() : widget.deselected();
        });
      },
      child: Container(
        width: widget.radius * 2,
        height: widget.radius * 2,
        // color: isSelected ? Colors.green : Colors.blue,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.radius * 0.35),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
        ),
      ),
    );
  }
}
