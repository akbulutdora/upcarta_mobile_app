import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/routes/explore/explore.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

class SeeAllCollectionsAndAsksView extends StatefulWidget {
  const SeeAllCollectionsAndAsksView({Key? key}) : super(key: key);

  @override
  State<SeeAllCollectionsAndAsksView> createState() =>
      _SeeAllCollectionsAndAsksViewState();
}

class _SeeAllCollectionsAndAsksViewState
    extends State<SeeAllCollectionsAndAsksView> {
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
              ),
              onPressed: () => Navigator.of(context).pop()),
          elevation: 0,
          titleSpacing: 0.0,
          title: const Text(
            'Collections and Asks',
            style: TextStyle(
                fontFamily: 'SFCompactText-Medium.ttf',
                fontWeight: FontWeight.w500,
                fontSize: 22),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(36),
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(height: 32, child: SearchBarCollectionsAndAsks()),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),

          child: SingleChildScrollView(
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2.25,
                    labelPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    tabs: <Widget>[Tab(text: 'Recent'), Tab(text: 'Popular')],
                    unselectedLabelStyle: kTabBarTextStyle,
                    labelStyle: kTabBarTextStyle,
                  ),
                ),
                SizedBox(
                  height: 580,
                  child: TabBarView(
                    children: <Widget>[
                      CollectionsAndAsksRecentView(),
                      CollectionsAndAsksPopularView()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
