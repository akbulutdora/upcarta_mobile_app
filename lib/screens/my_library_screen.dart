// BENGİSU

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/components/content_list.dart';


//void main() => runApp(const MyLibraryScreen());

class MyLibraryScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: UpcartaPages.libraryPath,
      key: ValueKey(UpcartaPages.libraryPath),
      child: MyLibraryScreen(),
    );
  }

  MyLibraryScreen({Key? key}) : super(key: key);
  //static const String _title = 'Flutter Code Sample';
/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: _title,
      home: MyStatelessWidget(),
    );
  }
}*/

final List<Content> contents = <Content>[
  Content(
      title: "podcast with bengisu",
      id: "1",
      contentType: ContentType.podcastEpisode,
      added_by_id: '',
      description: '',
      created_at: '',
      link: '',
      image: ''),
  Content(
      title: "book written by berna",
      id: "2",
      contentType: ContentType.book,
      added_by_id: '',
      link: '',
      description: '',
      created_at: '',
      image: ''),
  Content(
      title: "podcast about game-dev",
      id: "4",
      contentType: ContentType.podcast,
      description: '',
      created_at: '',
      link: '',
      added_by_id: '',
      image: ''),
];
/*
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key? key}) : super(key: key);
*/


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Saved' //, icon: Icon(Icons.bookmark_border_outlined),
                  ),
              Tab(text: 'Completed' //, icon: Icon(Icons.check),
                  ),
              Tab(text: 'Collections' //, icon: Icon(Icons.list_rounded),
                  ),
              Tab(text: 'Recos' //, icon: Icon(Icons.thumb_up_outlined),
                  ),
            ],
            labelColor: Colors.black54,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          //TODO: IMPLEMENT BUTTON FUNCTIONALITY
                        },
                        child: Text("Button1")
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Row(children:[
                      Text("Filter")
                    ]),
                    Row(children:[
                      Icon(Icons.person),
                      Icon(Icons.tag),
                      Icon(Icons.format_list_bulleted_rounded)
                    ]),
                  ],
                ),
                new Padding(
                    padding: EdgeInsets.all(8.0),
                    child: new Divider()
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Chip(
                      avatar: Icon(Icons.format_list_bulleted_rounded),
                      label: const Text('All'),
                    ),
                    Chip(
                      avatar: Icon(Icons.menu_book),
                      label: const Text('Book'),
                    ),
                    Chip(
                      avatar: Icon(Icons.videocam_outlined),
                      label: const Text('Video'),
                    ),
                    Chip(
                      avatar: Icon(Icons.podcasts),
                      label: const Text('Podcast'),
                    ),
                    Chip(
                      avatar: Icon(Icons.newspaper),
                      label: const Text('Art'),
                    ),
                  ],
                ),
                ContentList(
                  contentList: contents,
                ),
              ],
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's hello here"),
            ),
          ],
        ),
      ),
    );
  }
}


