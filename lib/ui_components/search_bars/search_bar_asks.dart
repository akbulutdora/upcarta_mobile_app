import 'package:flutter/material.dart';

import '../../util/styles.dart';

class SearchBarAsks extends StatefulWidget {
  const SearchBarAsks({Key? key}) : super(key: key);

  @override
  State<SearchBarAsks> createState() => _SearchBarAsksState();
}

class _SearchBarAsksState extends State<SearchBarAsks> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBarAsks();
  }
}

@override
Widget buildSearchBarAsks() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Search for asks',
        hintStyle: kSearchBarTextStyle,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
