import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';
import '../../../../../util/constants.dart';

class FeaturedCollections_Popular extends StatefulWidget {
  const FeaturedCollections_Popular({Key? key}) : super(key: key);

  @override
  State<FeaturedCollections_Popular> createState() =>
      _FeaturedCollections_PopularState();
}

class _FeaturedCollections_PopularState
    extends State<FeaturedCollections_Popular> {
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
