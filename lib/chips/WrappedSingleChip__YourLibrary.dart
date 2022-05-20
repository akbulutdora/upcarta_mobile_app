import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';

class WrappedSingleChip__YourLibrary extends StatefulWidget {
  const WrappedSingleChip__YourLibrary({Key? key}) : super(key: key);

  @override
  State<WrappedSingleChip__YourLibrary> createState() =>
      _WrappedSingleChip__YourLibraryState();
}

class _WrappedSingleChip__YourLibraryState
    extends State<WrappedSingleChip__YourLibrary> {
  int tag = 1;
  List<String> options = [
    '   All   ',
    'Contents',
    'Collections',
    ' Asks ',
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
      padding: const EdgeInsets.all(0),
      choiceStyle: C2ChoiceStyle(
        labelStyle:
            const TextStyle(fontSize: 12, fontFamily: "SFCompactText-Regular"),
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.fromLTRB(-3, 0, -3, 0),
        showCheckmark: false,
        color: Colors.black,
        backgroundColor: Colors.white,
        borderColor: Colors.grey[300],
      ),
      choiceActiveStyle: C2ChoiceStyle(
        labelStyle:
            const TextStyle(fontSize: 12, fontFamily: "SFCompactText-Regular"),
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.fromLTRB(-3, 0, -3, 0),
        showCheckmark: false,
        color: Colors.white,
        backgroundColor: Colors.blueAccent,
        borderColor: Colors.grey[300],
      ),
    );
  }
}
