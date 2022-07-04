import 'package:flutter/material.dart';

class SearchBarPeople extends StatefulWidget {
  const SearchBarPeople({Key? key}) : super(key: key);

  @override
  State<SearchBarPeople> createState() => _SearchBarPeopleState();
}

class _SearchBarPeopleState extends State<SearchBarPeople> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBarPeople();
  }
}

@override
Widget buildSearchBarPeople() => const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
        hintText: 'Search for people',
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
