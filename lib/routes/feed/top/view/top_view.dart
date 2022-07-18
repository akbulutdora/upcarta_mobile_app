library top_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import '../../../../util/styles.dart';
import 'package:upcarta_mobile_app/util/constants.dart';
import 'package:upcarta_mobile_app/routes/feed/feed.dart';

part 'top_view_header.dart';

class TopView extends StatefulWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  State<TopView> createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverAppBar(
            toolbarHeight: 0,
            leading: Container(),
            automaticallyImplyLeading: false,
            expandedHeight: 485.h,
            // collapsedHeight: 75,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            floating: true,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: TopViewHeader(),

              // This is where you build the profile part
            ),
          )
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0, right: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16.0,bottom: 8),
              child: Text('Contents', style: sectionStyle),
            ),
            ContentList(
              contentList: contents,
            ),
          ],
        ),
      ),
    );
  }
}
