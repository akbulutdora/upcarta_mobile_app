import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/constants.dart';

class ContentArchiveMostRecommendedView extends StatefulWidget {
  const ContentArchiveMostRecommendedView({Key? key}) : super(key: key);

  @override
  State<ContentArchiveMostRecommendedView> createState() =>
      _ContentArchiveMostRecommendedViewState();
}

class _ContentArchiveMostRecommendedViewState
    extends State<ContentArchiveMostRecommendedView> {
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
