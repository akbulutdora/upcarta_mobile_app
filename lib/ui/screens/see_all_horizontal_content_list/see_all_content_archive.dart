import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';
import 'package:upcarta_mobile_app/ui/components/search_bar.dart';

import '../../../util/constants.dart';

class SeeAll_ContentArchive extends StatefulWidget {
  const SeeAll_ContentArchive({Key? key}) : super(key: key);

  @override
  State<SeeAll_ContentArchive> createState() => _SeeAll_ContentArchiveState();
}

class _SeeAll_ContentArchiveState extends State<SeeAll_ContentArchive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFC4C4C4),
            ),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0.0,
        title: const Text(
          'Explore Contents',
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
          SizedBox(height: 32, child: SearchBar()),
          SizedBox(height: 12),
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
