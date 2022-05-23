import 'package:flutter/material.dart';

class SearchBar_Topics extends StatefulWidget {
  const SearchBar_Topics({Key? key}) : super(key: key);

  @override
  State<SearchBar_Topics> createState() => _SearchBar_TopicsState();
}

class _SearchBar_TopicsState extends State<SearchBar_Topics> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar_Topics();
  }
}

@override
Widget buildSearchBar_Topics() => const TextField(
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
