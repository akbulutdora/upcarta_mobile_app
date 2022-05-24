import 'package:flutter/material.dart';

class SearchBarContents extends StatefulWidget {
  const SearchBarContents({Key? key}) : super(key: key);

  @override
  State<SearchBarContents> createState() => _SearchBarContentsState();
}

class _SearchBarContentsState extends State<SearchBarContents> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBarContents();
  }
}

@override
Widget buildSearchBarContents() => const TextField(
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
