// BENGİSU

import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/components/content_list.dart';

/*
class MyLibraryScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: UpcartaPages.loginPath,
      key: ValueKey(UpcartaPages.loginPath),
      child: const MyLibraryScreen(),
    );
  }

  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green,);
  }
}*/

void main() => runApp(const MyLibraryScreen());

class MyLibraryScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: UpcartaPages.libraryPath,
      key: ValueKey(UpcartaPages.libraryPath),
      child: const MyLibraryScreen(),
    );
  }

  const MyLibraryScreen({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

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

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
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
                        child: Text("Button1")),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Row2"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Row3"),
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

/*
            Center(
              child: Text("It's cloudy here"),
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
            */

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    const Icon(Icons.star, color: Colors.black),
    const Icon(Icons.star, color: Colors.black),
  ],
);

final ratings = Container(
  padding: const EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      const Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  ),
);

////////////////

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<DropDownButton> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      borderRadius: BorderRadius.circular(2),
      icon: const Icon(Icons.arrow_downward),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'MOST RECOMMENDED',
        'FOLLOWING',
        'NEW TO OLD',
        'OLD TO NEW',
        'DEFAULT'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
    ;
  }
}
