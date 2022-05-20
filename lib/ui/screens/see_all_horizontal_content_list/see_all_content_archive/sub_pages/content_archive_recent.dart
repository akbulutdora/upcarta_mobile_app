import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';
import '../../../../../util/constants.dart';

class ContentArchive_Recent extends StatefulWidget {
  const ContentArchive_Recent({Key? key}) : super(key: key);

  @override
  State<ContentArchive_Recent> createState() => _ContentArchive_RecentState();
}

class _ContentArchive_RecentState extends State<ContentArchive_Recent> {
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
