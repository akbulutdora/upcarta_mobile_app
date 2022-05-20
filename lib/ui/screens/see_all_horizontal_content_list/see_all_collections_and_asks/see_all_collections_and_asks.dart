import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/collection_card.dart';
import 'package:upcarta_mobile_app/ui/components/search_bar.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';

import '../../../../util/constants.dart';

class SeeAll_CollectionsAndAsks extends StatefulWidget {
  const SeeAll_CollectionsAndAsks({Key? key}) : super(key: key);

  @override
  State<SeeAll_CollectionsAndAsks> createState() =>
      _SeeAll_CollectionsAndAsksState();
}

class _SeeAll_CollectionsAndAsksState extends State<SeeAll_CollectionsAndAsks> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFC4C4C4),
              ),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0.0,
          title: const Text(
            'Collections and Asks',
            style: TextStyle(
                fontFamily: "SFCompactText-Medium.ttf",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(36),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(height: 32, child: SearchBar()),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            children: const [
              PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2.25,
                    labelPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    tabs: <Widget>[Tab(text: 'Recent'), Tab(text: 'Popular')],
                    unselectedLabelColor: Color(0xffC4C4C4),
                    unselectedLabelStyle: TextStyle(
                        fontFamily: 'SFCompactText-SemiBold.ttf',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    labelColor: Color(0xff4E89FD),
                    labelStyle: TextStyle(
                        fontFamily: 'SFCompactText-SemiBold.ttf',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 580,
                child: TabBarView(
                  children: <Widget>[
                    CollectionsAndAsks_Recent(),
                    CollectionsAndAsks_Popular()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
