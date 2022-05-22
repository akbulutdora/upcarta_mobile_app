import 'package:flutter/material.dart';

class SearchBar_Asks extends StatefulWidget {
  const SearchBar_Asks({Key? key}) : super(key: key);

  @override
  State<SearchBar_Asks> createState() => _SearchBar_AsksState();
}

class _SearchBar_AsksState extends State<SearchBar_Asks> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar_Asks();
  }
}

@override
Widget buildSearchBar_Asks() => const TextField(
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
