import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui/components/search_bars/search_bar_asks.dart';
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_recent_asks/sub_pages/recent_asks_popular.dart';
import 'package:upcarta_mobile_app/ui/screens/see_all_horizontal_content_list/see_all_recent_asks/sub_pages/recent_asks_recent.dart';

class SeeAll_RecentAsks extends StatefulWidget {
  const SeeAll_RecentAsks({Key? key}) : super(key: key);

  @override
  State<SeeAll_RecentAsks> createState() => _SeeAll_RecentAsksState();
}

class _SeeAll_RecentAsksState extends State<SeeAll_RecentAsks> {
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
            'Explore Asks',
            style: TextStyle(
                fontFamily: "SFCompactText-Medium.ttf",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(36),
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(height: 32, child: SearchBar_Asks()),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            children: const [
              PreferredSize(
                preferredSize: Size.fromHeight(40),
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
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    labelColor: Color(0xff4E89FD),
                    labelStyle: TextStyle(
                        fontFamily: 'SFCompactText-SemiBold.ttf',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 580,
                child: TabBarView(
                  children: <Widget>[RecentAsks_Recent(), RecentAsks_Popular()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
