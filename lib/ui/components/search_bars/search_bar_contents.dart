import 'package:flutter/material.dart';

class SearchBar_Contents extends StatefulWidget {
  const SearchBar_Contents({Key? key}) : super(key: key);

  @override
  State<SearchBar_Contents> createState() => _SearchBar_ContentsState();
}

class _SearchBar_ContentsState extends State<SearchBar_Contents> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar_Contents();
  }
}

@override
Widget buildSearchBar_Contents() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Search for contents',
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
