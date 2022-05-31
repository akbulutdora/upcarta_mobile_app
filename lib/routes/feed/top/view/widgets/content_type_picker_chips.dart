import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/util/colors.dart';

class ContentTypePickerChips extends StatefulWidget {
  const ContentTypePickerChips({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentTypePickerChips> createState() => _ContentTypePickerChipsState();
}

class _ContentTypePickerChipsState extends State<ContentTypePickerChips> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> contentTypeDict = [
      {"name": "All", "icon": Icons.star_border},
      {"name": "Book", "icon": Icons.star_border},
      {"name": "Article", "icon": Icons.star_border},
      {"name": "Tweet", "icon": Icons.star_border},
      {"name": "Video", "icon": Icons.star_border},
      {"name": "Podcast", "icon": Icons.star_border},
    ];

    int _contentTypeValue = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Wrap(
        spacing: 4,
        alignment: WrapAlignment.start,
        children: List<Widget>.generate(
          contentTypeDict.length,
          (int index) {
            return ChoiceChip(
              disabledColor: Colors.white,
              selectedColor: AppColors.upcartaBlue,
              backgroundColor: Colors.white,
              side: BorderSide(color: AppColors.gray1BoxFrame),
              avatar: Icon(contentTypeDict[index]["icon"]),
              label: Text(
                contentTypeDict[index]["name"],
                style: TextStyle(
                  color:
                      _contentTypeValue == index ? Colors.white : Colors.black,
                ),
              ),
              selected: _contentTypeValue == index,
              onSelected: (bool selected) {
                setState(() {
                  _contentTypeValue = selected ? index : 0;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
