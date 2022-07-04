import 'package:flutter/material.dart';

class SearchBarCollections extends StatefulWidget {
  const SearchBarCollections({Key? key}) : super(key: key);

  @override
  State<SearchBarCollections> createState() => _SearchBarCollectionsState();
}

class _SearchBarCollectionsState extends State<SearchBarCollections> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBarCollections();
  }
}

@override
Widget buildSearchBarCollections() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Search for collections',
        hintStyle: TextStyle(
            fontFamily: 'SFCompactText-Regular',
            color: Color(0xff949494),
            fontWeight: FontWeight.w400,
            fontSize: 13),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
