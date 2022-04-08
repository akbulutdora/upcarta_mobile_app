// BERNA
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/circle_image.dart';

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
          const SizedBox(height: 16.0),
          buildProfile(),
          Expanded(
            child: buildMenu(),
          )
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

  Widget buildProfile() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CircleImage(
              imageProvider: AssetImage("images/mock.jpg"),
              //widget.user.profileImageUrl),
              imageRadius: 60.0,
            ),
            MaterialButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Text(
                'Follow',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Provider.of<AppStateManager>(context, listen: false)
                    .follow('followUsername');
              },
            ),
          ]),
          const SizedBox(height: 16.0),
          Text(
            widget.user.name,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            '@${widget.user.username}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          Text(
            widget.user.role,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          Text(
            widget.user.bio,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  '${widget.user.followers} following',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '${widget.user.following} following',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
