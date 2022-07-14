import 'package:flutter/material.dart';

class DateRangePickerChips extends StatefulWidget {
  const DateRangePickerChips({
    Key? key,
  }) : super(key: key);

  @override
  State<DateRangePickerChips> createState() => _DateRangePickerChipsState();
}

class _DateRangePickerChipsState extends State<DateRangePickerChips> {
  @override
  Widget build(BuildContext context) {
    List<String> dateRangeNames = ['Week', 'Month', 'Year', 'All'];
    int _dateRangeValue = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Wrap(
        spacing: 4,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List<Widget>.generate(
          dateRangeNames.length,
          (int index) {
            return ChoiceChip(
              selectedColor: Theme.of(context).chipTheme.backgroundColor,
              side: Theme.of(context).chipTheme.side,
              label: Text(
                dateRangeNames[index],
                style: TextStyle(
                  color: _dateRangeValue == index ? Theme.of(context).chipTheme.selectedColor : Theme.of(context).chipTheme.disabledColor,
                ),
              ),
              selected: _dateRangeValue == index,
              onSelected: (bool selected) {
                // FIXME: Nothing happens onPressed
                setState(() {
                  _dateRangeValue = selected ? index : 0;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
