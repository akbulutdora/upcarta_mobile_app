import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';
import 'package:upcarta_mobile_app/ui/components/search_bars/search_bar_topics.dart';

import '../../../util/constants.dart';

class SeeAll_PopularTopics extends StatefulWidget {
  const SeeAll_PopularTopics({Key? key}) : super(key: key);

  @override
  State<SeeAll_PopularTopics> createState() => _SeeAll_PopularTopicsState();
}

class _SeeAll_PopularTopicsState extends State<SeeAll_PopularTopics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFC4C4C4),
            ),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0.0,
        title: const Text(
          'Explore Topics',
          style: TextStyle(
              fontFamily: "SFCompactText-Medium.ttf",
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(children: [
          const SizedBox(height: 32, child: SearchBar_Topics()),
          const SizedBox(height: 12),
          SingleChildScrollView(
            child: Container(
              height: 600,
              child: Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: contents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CollectionCard(content: contents[index]);
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
