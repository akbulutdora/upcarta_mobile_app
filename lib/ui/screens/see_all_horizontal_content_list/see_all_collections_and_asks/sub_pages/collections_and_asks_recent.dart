import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';

import '../../../../../util/constants.dart';

class CollectionsAndAsks_Recent extends StatefulWidget {
  const CollectionsAndAsks_Recent({Key? key}) : super(key: key);

  @override
  State<CollectionsAndAsks_Recent> createState() =>
      _CollectionsAndAsks_RecentState();
}

class _CollectionsAndAsks_RecentState extends State<CollectionsAndAsks_Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          SingleChildScrollView(
            child: Container(
              height: 580,
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
