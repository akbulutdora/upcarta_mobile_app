import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/constants.dart';

class CollectionsAndAsksRecentView extends StatefulWidget {
  const CollectionsAndAsksRecentView({Key? key}) : super(key: key);

  @override
  State<CollectionsAndAsksRecentView> createState() =>
      _CollectionsAndAsksRecentViewState();
}

class _CollectionsAndAsksRecentViewState
    extends State<CollectionsAndAsksRecentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SingleChildScrollView(
          child: SizedBox(
            height: 580,
            child: Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: contents.length,
                itemBuilder: (BuildContext context, int index) {
                  return CollectionCard(content: contents[index]);
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
