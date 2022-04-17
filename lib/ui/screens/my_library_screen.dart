// BENGİSU

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/components/content_list.dart';

import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';


//void main() => runApp(const MyLibraryScreen());

class MyLibraryScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: MyLibraryScreen(),
    );
  }

  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class Category
{
  String label="";
  //Icon icon=Icon(Icons.person);
  bool isSelected=false;
  Category(this.label, this.isSelected); //, this.icon
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  bool selected = false;
  final List<Category> _catList = [
    Category("All", true), //Icon(Icons.format_list_bulleted_rounded)
    Category("Contents", false), //, Icon(Icons.menu_book)
    Category("Collections", false), //, Icon(Icons.videocam_outlined)
    Category("Asks", false), //, Icon(Icons.podcasts)
  ];

  final List<Content> contents = <Content>[
  Content(title: "podcast with bengisu", id: "1", contentType: ContentType.podcastEpisode, added_by_id: '',
      description: '', created_at: '', link: '', image: ''),
  Content(title: "book written by berna", id: "2", contentType: ContentType.book, added_by_id: '', link: '',
      description: '', created_at: '', image: ''),
  Content(title: "podcast about game-dev", id: "4", contentType: ContentType.podcast, description: '',
      created_at: '', link: '', added_by_id: '', image: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.tabBarColor,
          elevation: 0,
          toolbarHeight: 0,
          //titleTextStyle: libraryTabBar,
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'Saved' ),
              Tab(text: 'Completed' ),
              Tab(text: 'Collections' ),
              Tab(text: 'Recommends' ),
            ],
            unselectedLabelColor: Color(0xffC4C4C4),
            unselectedLabelStyle: libraryTabBar,
            labelColor: Color(0xff4E89FD),
            labelStyle: libraryTabBar
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height:16.0),
                Container(
                  padding: const EdgeInsets.only(left:16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: catChips(),
                  ),
                ),
                SizedBox(height:16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left:16.0),
                          height: 22,
                          width: 185,
                          child: TextFormField(
                            cursorHeight: 12,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              labelText:'Search...',
                              labelStyle: searchBarText,
                              border: OutlineInputBorder(),

                            ),
                          ),
                        ),
                        SizedBox(width:4.0),
                        Container(
                          height: 22.0,
                          child: OutlinedButton(
                            onPressed: () {
                              debugPrint('Received click');
                            },
                            child: const Text('Sort',style:searchButtonText),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.dashboard_outlined),
                        SizedBox(width:6.0),
                        Icon(Icons.person_outline_outlined),
                        SizedBox(width:6.0),
                        Icon(Icons.tag),
                        SizedBox(width:6.0),
                      ],
                    ),


                  ],
                ),

                const Divider(
                  color: Color(0xff949494),
                ),
                ContentList(
                  contentList: contents,
                ),
              ],
            ),
            const Center(
              child:  Text("Completed page"),
            ),
            const Center(
              child: Text("Collections page"),
            ),
            const Center(
              child: Text("Recommendations page"),
            ),
          ],
        ),
      ),
    );
  }


  List<Widget> catChips () {
    List<Widget> chips = [];
    for (int i=0; i< _catList.length; i++) {
      Widget item = FilterChip(
        label: Text(_catList[i].label, style: TextStyle(color: _catList[i].isSelected? AppColors.chip:AppColors.secondary) ),
        //avatar: _catList[i].icon,
        labelStyle: kTextStyle9,
        backgroundColor: Colors.transparent,
        shape: StadiumBorder(side: BorderSide(color: Color(0xffDEDEDE))),
        disabledColor: AppColors.chip,
        selectedColor: AppColors.selected,
        showCheckmark: false,
        selected: _catList[i].isSelected,
        onSelected: (bool value)
        {
          setState(() {
            _catList[i].isSelected = value;
          });
        },
      );
      chips.add(item);
      chips.add(SizedBox(width:8.0));
    }
    return chips;
  }
}



