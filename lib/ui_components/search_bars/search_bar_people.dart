import 'package:flutter/material.dart';

class SearchBar_People extends StatefulWidget {
  const SearchBar_People({Key? key}) : super(key: key);

  @override
  State<SearchBar_People> createState() => _SearchBar_PeopleState();
}

class _SearchBar_PeopleState extends State<SearchBar_People> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar_People();
  }
}

@override
Widget buildSearchBar_People() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Search for people',
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
