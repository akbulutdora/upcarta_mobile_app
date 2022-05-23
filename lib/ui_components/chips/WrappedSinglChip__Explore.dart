import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';

class WrappedSingleChip extends StatefulWidget {
  const WrappedSingleChip({Key? key}) : super(key: key);

  @override
  State<WrappedSingleChip> createState() => _WrappedSingleChipState();
}

class _WrappedSingleChipState extends State<WrappedSingleChip> {
  int tag = 1;
  List<String> options = [
    '   All   ',
    'Collections',
    'People',
    'Topics',
    ' Asks ',
    'Contents',
  ];

  @override
  Widget build(BuildContext context) {
    return ChipsChoice.single(
      value: tag,
      onChanged: (int val) => setState(() => tag = val),
      crossAxisAlignment: CrossAxisAlignment.start,
      choiceItems: C2Choice.listFrom(
          source: options, value: (i, v) => i, label: (i, String v) => v),
      wrapped: true,
      spacing: 6,
      padding: EdgeInsets.all(0),
      choiceStyle: C2ChoiceStyle(
        labelStyle:
            TextStyle(fontSize: 12, fontFamily: "SFCompactText-Regular"),
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.fromLTRB(-3, 0, -3, 0),
        showCheckmark: false,
        color: Colors.black,
        backgroundColor: Colors.white,
        borderColor: Colors.grey[300],
      ),
      choiceActiveStyle: C2ChoiceStyle(
        labelStyle:
            TextStyle(fontSize: 12, fontFamily: "SFCompactText-Regular"),
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.fromLTRB(-3, 0, -3, 0),
        showCheckmark: false,
        color: Colors.white,
        backgroundColor: Colors.blueAccent,
        borderColor: Colors.grey[300],
      ),
    );
  }
}
