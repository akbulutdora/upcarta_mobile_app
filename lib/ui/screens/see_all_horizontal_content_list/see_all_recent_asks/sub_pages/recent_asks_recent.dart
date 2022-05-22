import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';
import '../../../../../util/constants.dart';

class RecentAsks_Recent extends StatefulWidget {
  const RecentAsks_Recent({Key? key}) : super(key: key);

  @override
  State<RecentAsks_Recent> createState() => _RecentAsks_RecentState();
}

class _RecentAsks_RecentState extends State<RecentAsks_Recent> {
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
