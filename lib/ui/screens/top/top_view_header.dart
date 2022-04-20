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
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Collections and Asks", style: sectionStyle),
                OutlinedButton(
                  style: outlinedButtonStyle,
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                        fontFamily: "SF Compact Text",
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          // CollectionCard(content: topContents[0]),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(0),
              itemCount: topContents.length,
              itemBuilder: (BuildContext context, int index) {
                return CollectionCard(content: topContents[index]);
              },
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
