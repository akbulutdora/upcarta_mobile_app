library top_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/feed_content_list.dart';

// import 'package:upcarta_mobile_app/components/content_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/ui/screens/top/widgets/content_type_picker_chips.dart';
import 'package:upcarta_mobile_app/ui/screens/top/widgets/date_range_picker_chips.dart';
import '../../../util/styles.dart';
import '../../components/horizontal_content_list/horizontal_content_list__collectons_and_asks.dart';
import 'package:upcarta_mobile_app/util/constants.dart';

part "top_view_header.dart";

final FirebaseAuth _auth = FirebaseAuth.instance;

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
            expandedHeight: 400,
            // collapsedHeight: 75,
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: TopViewHeader(),

              // This is where you build the profile part
            ),
          )
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text("Contents", style: sectionStyle),
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
