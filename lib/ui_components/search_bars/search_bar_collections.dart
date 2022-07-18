import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

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
        hintStyle: kSearchBarTextStyle,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
