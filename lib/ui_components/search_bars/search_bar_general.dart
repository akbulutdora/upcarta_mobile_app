import 'package:flutter/material.dart';

import '../../util/styles.dart';

class SearchBarGeneral extends StatefulWidget {
  const SearchBarGeneral({Key? key}) : super(key: key);

  @override
  State<SearchBarGeneral> createState() => _SearchBarGeneralState();
}

class _SearchBarGeneralState extends State<SearchBarGeneral> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBarGeneral();
  }
}

@override
Widget buildSearchBarGeneral() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Content, people, topic, collection, or ask',
        hintStyle: kSearchBarTextStyle,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
