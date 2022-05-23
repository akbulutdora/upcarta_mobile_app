import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/util/constants.dart';

class CollectionsAndAsks_Popular extends StatefulWidget {
  const CollectionsAndAsks_Popular({Key? key}) : super(key: key);

  @override
  State<CollectionsAndAsks_Popular> createState() =>
      _CollectionsAndAsks_PopularState();
}

class _CollectionsAndAsks_PopularState
    extends State<CollectionsAndAsks_Popular> {
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
