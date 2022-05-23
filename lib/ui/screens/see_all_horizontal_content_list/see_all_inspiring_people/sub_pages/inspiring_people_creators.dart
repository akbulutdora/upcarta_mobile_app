import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';
import '../../../../../util/constants.dart';

class InspiringPeople_Creators extends StatefulWidget {
  const InspiringPeople_Creators({Key? key}) : super(key: key);

  @override
  State<InspiringPeople_Creators> createState() =>
      _InspiringPeople_CreatorsState();
}

class _InspiringPeople_CreatorsState extends State<InspiringPeople_Creators> {
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
