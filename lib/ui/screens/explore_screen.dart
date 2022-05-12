import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/ui/components/horizontal_content_list.dart';

class ExploreScreen extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(child: ExploreScreen());
  }

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            "assets/images/upcarta-logo-small.png",
            width: 30,
            height: 30,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0.0,
          title: const Text(
            'Explore',
            style: TextStyle(
                fontFamily: "SFCompactText-Medium",
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 32, child: buildSearchBar()),
              Container(
                height: 24,
                child: Chip(
                  elevation: 0,

                  backgroundColor: Colors.blueAccent,
                  shadowColor: Colors.black,
                  label: Text(
                    'All',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ), //Text
                ),
              ), //Chip
              HorizontalContentList(),
            ],
          ),
        ));
  }

  Widget buildSearchBar() => const TextField(
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
}
