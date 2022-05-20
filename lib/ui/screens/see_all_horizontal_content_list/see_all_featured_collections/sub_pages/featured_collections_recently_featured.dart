import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';

import '../../../../../util/constants.dart';

class FeaturedCollections_RecentlyFeatured extends StatefulWidget {
  const FeaturedCollections_RecentlyFeatured({Key? key}) : super(key: key);

  @override
  State<FeaturedCollections_RecentlyFeatured> createState() =>
      _FeaturedCollections_RecentlyFeaturedState();
}

class _FeaturedCollections_RecentlyFeaturedState
    extends State<FeaturedCollections_RecentlyFeatured> {
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
