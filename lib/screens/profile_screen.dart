// BERNA
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/circle_image.dart';
import 'package:upcarta_mobile_app/components/content_list.dart';
import '../models/models.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPage page(User user) {
    return MaterialPage(
      name: UpcartaPages.profilePath,
      key: ValueKey(UpcartaPages.profilePath),
      child: ProfileScreen(user: user),
    );
  }

  final User user;

  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SizedBox(child: buildTabController()))
        ],
      ),
    );
  }

  Widget buildMenu() {
    return ListView(
      children: [
        buildDarkModeRow(),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            // 1
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
            // 2
            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }

  Widget buildDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: widget.user.darkMode,
            onChanged: (value) {
              Provider.of<ProfileManager>(context, listen: false).darkMode =
                  value;
            },
          )
        ],
      ),
    );
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

  Widget buildTabController() {
    return MaterialApp(
        home: DefaultTabController(
            length: 5,
            child: Scaffold(
                //put into the components
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        TabBar(
                            unselectedLabelColor: Colors.black,
                            isScrollable: true,
                            labelColor: Colors.black,
                            tabs: [
                              Tab(text: "Overview"),
                              Tab(text: "Content"),
                              Tab(text: "Recs"),
                              Tab(text: "Collections"),
                              Tab(text: "Asks")
                            ])
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    Column(
                      children: [
                        Text(
                          "AYY",
                          style: TextStyle(
                              fontFamily: "SFCompactText",
                              color: Colors.black,
                              fontSize: 50),
                        ),
                        Text(
                          "LMAO",
                          style: TextStyle(
                              fontFamily: "SFCompactText",
                              color: Colors.black,
                              fontSize: 50),
                        ),
                        Text(
                          "LMAO",
                          style: TextStyle(
                              fontFamily: "SFCompactText",
                              color: Colors.black,
                              fontSize: 50),
                        ),
                        Text(
                          "LMAO",
                          style: TextStyle(
                              fontFamily: "SFCompactText",
                              color: Colors.black,
                              fontSize: 50),
                        ),
                        Text(
                          "LMAO",
                          style: TextStyle(
                              fontFamily: "SFCompactText",
                              color: Colors.black,
                              fontSize: 50),
                        ),
                      ],
                    ),
                    Column(),
                    Column(),
                    Column(),
                    Column(),
                    Tab(text: "Recs"),
                    Tab(text: "Collections"),
                    Tab(text: "Asks")
                  ],
                ),
                expandedHeight: 375,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: buildProfile(),

                  // This is where you build the profile part
                ),
              ),

            ];
          },
          body: TabBarView(
            children: [
              Column(
                children: [
                  ContentList(
                    contentList: contents,
                  ),
                ],
              ),
              Column(),
              Column(),
              Column(),
              Column(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CircleImage(
              imageProvider: AssetImage("images/mock.jpg"),
              //widget.user.profileImageUrl),
              imageRadius: 55.0,
            ),
            MaterialButton(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)),
              child: const Text(
                'Follow',
                style: TextStyle(
                    fontFamily: "SFCompactText",
                    color: Colors.white,
                    fontSize: 18),
              ),
              onPressed: () async {
                Provider.of<AppStateManager>(context, listen: false)
                    .follow('followUsername');
              },
            ),
          ]),
          const SizedBox(height: 10.0),
          Text(
            widget.user.name,
            style: TextStyle(
              fontFamily: "SFCompactText",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ), // bold
          ),
          Text(
            '@${widget.user.username}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 10.0),
          Text(
            widget.user.bio,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      '${widget.user.followers}',
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' followers',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ]),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 8.0),
                  )),
              TextButton(
                onPressed: () {},
                child: Row(children: [
                  Text(
                    '${widget.user.following}',
                    style: TextStyle(
                      fontFamily: "SFCompactText",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' following',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ]),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                CircleImage(
                  imageProvider: AssetImage("images/mock.jpg"),
                  //widget.user.profileImageUrl),
                  imageRadius: 20.0,
                ),
                Text(
                  'Also followed by "mutualFollowed" and others',
                  //this appears if there are mutuals and make others appear when there are more
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
