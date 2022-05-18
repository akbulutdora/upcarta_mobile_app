import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar();
  }
}

@override
Widget buildSearchBar() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Content, people, topic, collection, or ask',
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
