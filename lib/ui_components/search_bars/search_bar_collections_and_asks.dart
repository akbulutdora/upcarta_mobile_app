import 'package:flutter/material.dart';

class SearchBar_CollectionsAndAsks extends StatefulWidget {
  const SearchBar_CollectionsAndAsks({Key? key}) : super(key: key);

  @override
  State<SearchBar_CollectionsAndAsks> createState() =>
      _SearchBar_CollectionsAndAsksState();
}

class _SearchBar_CollectionsAndAsksState
    extends State<SearchBar_CollectionsAndAsks> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar_CollectionsAndAsks();
  }
}

@override
Widget buildSearchBar_CollectionsAndAsks() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Search for asks',
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
