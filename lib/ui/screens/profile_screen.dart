// BERNA
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcarta_mobile_app/components/circle_image.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:auto_route/auto_route.dart';

User user = User(
  name: 'Mana',
  username: 'manaira',
  //how to put @ before?
  role: 'Flutterista',
  avatar: 'assets/images/mock.jpg',
  bio:
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fermentum, a id nunc, odio augue enim. Viverra nullam pulvinar volutpat ultricies hendrerit sed. Morbi eget a nisi nulla vulputate vestibulum purus sodales.',
  darkMode: false,
  id: '12345',
  email: 'mana@gmail.com',
  confirmed_at: '',
  reset_password_sent_at: '',
  reset_password_token: '',
  confirmation_sent_at: '',
  password_hash: '',
  confirmation_token: '',
  following: 12,
  followers: 10,
);

class ProfileScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: ProfileScreen(),
    );
  }

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
            // Provider.of<ProfileManager>(context, listen: false)
            //     .tapOnProfile(false);
            // 2
            // Provider.of<AppStateManager>(context, listen: false).logout();
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
            value: user.darkMode,
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
              imageProvider: AssetImage("assets/images/mock.jpg"),
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
                // Provider.of<AppStateManager>(context, listen: false)
                //     .follow('followUsername');
              },
            ),
          ]),
          const SizedBox(height: 16.0),
          Text(
            user.name,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            '@${user.username}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          Text(
            user.role,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          Text(
            user.bio,
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
                  '${user.followers} following',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '${user.following} following',
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
