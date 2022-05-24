import 'package:flutter/material.dart';

class SearchBarCollectionsAndAsks extends StatefulWidget {
  const SearchBarCollectionsAndAsks({Key? key}) : super(key: key);

  @override
  State<SearchBarCollectionsAndAsks> createState() =>
      _SearchBarCollectionsAndAsksState();
}

class _SearchBarCollectionsAndAsksState
    extends State<SearchBarCollectionsAndAsks> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBarCollectionsAndAsks();
  }
}

@override
Widget buildSearchBarCollectionsAndAsks() => const TextField(
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
