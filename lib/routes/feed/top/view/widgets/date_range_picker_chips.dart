import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

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
    List<String> dateRangeNames = ["Week", "Month", "Year", "All"];
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
              disabledColor: Colors.white,
              selectedColor: AppColors.upcartaBlue,
              backgroundColor: Colors.white,
              side: BorderSide(color: AppColors.gray1BoxFrame),
              label: Text(
                dateRangeNames[index],
                style: TextStyle(
                  color: _dateRangeValue == index ? Colors.white : Colors.black,
                ),
              ),
              selected: _dateRangeValue == index,
              onSelected: (bool selected) {
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
