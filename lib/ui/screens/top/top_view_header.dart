part of top_view;

class TopViewHeader extends StatefulWidget {
  const TopViewHeader({Key? key}) : super(key: key);

  @override
  State<TopViewHeader> createState() => _TopViewHeaderState();
}

class _TopViewHeaderState extends State<TopViewHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            thickness: 1,
          ),
          const DateRangePickerChips(),
          const ContentTypePickerChips(),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 12),
          HorizontalContentList(),
          // ),
        ],
      ),
    );
  }
}
