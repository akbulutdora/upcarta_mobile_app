// DORA
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/components/content_list.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/screens/home.dart';

class HomeScreen extends StatelessWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: UpcartaPages.home,
      key: ValueKey(UpcartaPages.home),
      child: HomeScreen(),
    );
  }

  HomeScreen({
    Key? key,
  }) : super(key: key);

  final List<Content> contents = <Content>[
    Content(title: "podcast with bengisu", id: "1", contentType: ContentType.podcastEpisode),
    Content(title: "book written by berna", id: "2", contentType: ContentType.book),
    Content(title: "article of idil", id: "3", contentType: ContentType.article),
    Content(title: "podcast about game-dev", id: "4", contentType: ContentType.podcast),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Latest"),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(onPressed: () {}, child: Text("Explore"))
                ],
              ),
              Divider(thickness: 1,),
              Row(
                children: [
                  MyDropDownButton(),
                  SizedBox(width: 8,),
                  MyDropDownButton(),
                ],
              ),
              Divider(thickness: 1,),
              ContentList(contentList: contents,),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({Key? key}) : super(key: key);

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      borderRadius: BorderRadius.circular(2),
      icon: const Icon(Icons.arrow_downward),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );;
  }
}
