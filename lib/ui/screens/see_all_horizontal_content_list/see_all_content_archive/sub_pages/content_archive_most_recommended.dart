import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';
import '../../../../../util/constants.dart';

class ContentArchive_MostRecommended extends StatefulWidget {
  const ContentArchive_MostRecommended({Key? key}) : super(key: key);

  @override
  State<ContentArchive_MostRecommended> createState() =>
      _ContentArchive_MostRecommendedState();
}

class _ContentArchive_MostRecommendedState
    extends State<ContentArchive_MostRecommended> {
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
    );
  }
}
