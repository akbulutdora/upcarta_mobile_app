import 'package:flutter/material.dart';

class SearchBar_General extends StatefulWidget {
  const SearchBar_General({Key? key}) : super(key: key);

  @override
  State<SearchBar_General> createState() => _SearchBar_GeneralState();
}

class _SearchBar_GeneralState extends State<SearchBar_General> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar_General();
  }
}

@override
Widget buildSearchBar_General() => const TextField(
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
