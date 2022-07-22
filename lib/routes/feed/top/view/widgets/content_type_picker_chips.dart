import 'package:flutter/material.dart';


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
      {'name': 'All', 'icon': Icons.star_border},
      {'name': 'Book', 'icon': Icons.star_border},
      {'name': 'Article', 'icon': Icons.star_border},
      {'name': 'Tweet', 'icon': Icons.star_border},
      {'name': 'Video', 'icon': Icons.star_border},
      {'name': 'Podcast', 'icon': Icons.star_border},
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

              avatar: Icon(contentTypeDict[index]['icon'],
              color: _contentTypeValue == index ? Theme.of(context).chipTheme.backgroundColor: Colors.black,),
              label: Text(
                contentTypeDict[index]['name'],
              ),
              labelStyle: TextStyle(
                color: _contentTypeValue == index ? Theme.of(context).chipTheme.disabledColor : Colors.black,
              ),
              selected: _contentTypeValue == index,
              onSelected: (bool selected) {
                // FIXME: Nothing happens
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
