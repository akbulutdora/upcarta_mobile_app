import 'package:flutter/material.dart';

class SearchBarTopics extends StatefulWidget {
  const SearchBarTopics({Key? key}) : super(key: key);

  @override
  State<SearchBarTopics> createState() => _SearchBarTopicsState();
}

class _SearchBarTopicsState extends State<SearchBarTopics> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBarTopics();
  }
}

@override
Widget buildSearchBarTopics() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Search for topics',
        hintStyle: TextStyle(
            fontFamily: "SFCompactText-Regular",
            color: Color(0xff949494),
            fontWeight: FontWeight.w400,
            fontSize: 13),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
