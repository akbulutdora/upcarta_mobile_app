import 'package:flutter/material.dart';

class SearchBar_Collections extends StatefulWidget {
  const SearchBar_Collections({Key? key}) : super(key: key);

  @override
  State<SearchBar_Collections> createState() => _SearchBar_CollectionsState();
}

class _SearchBar_CollectionsState extends State<SearchBar_Collections> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar_Collections();
  }
}

@override
Widget buildSearchBar_Collections() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Search for collections',
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
