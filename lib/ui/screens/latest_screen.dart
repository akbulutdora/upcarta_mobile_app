import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/components/content_list.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/src/authentication.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final List<Content> contents = <Content>[
  Content(
    title: "THIS IS LATEST SCREEN",
    id: "1",
    contentType: ContentType.podcastEpisode,
    added_by_id: '',
    description:
        'bbgisuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',
    created_at: '',
    link: 'https://www.linkedin.com/in/bengisueren?originalSubdomain=tr',
    image:
        "data:image/jpeg;base64,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",
  ),
  Content(
      title: "book written by berna",
      id: "2",
      contentType: ContentType.book,
      added_by_id: '',
      link: 'www.google.com',
      description: 'berna',
      created_at: '',
      image:
          'https://i.pinimg.com/originals/e8/15/b9/e815b94b7a82d7c6e2f4c791bf984d98.jpg'),
  Content(
      title: "article of idil",
      id: "3",
      contentType: ContentType.article,
      created_at: '',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      link: 'https://lmgtfy.app/?q=dora+the+explorer',
      added_by_id: '',
      image: 'https://images.gamebanana.com/img/ico/sprays/5c8d6b4f8f5ba.png'),
  Content(
      title: "podcast about game-dev",
      id: "4",
      contentType: ContentType.podcast,
      description: 'it\'s about game dev',
      created_at: '',
      link: 'URL',
      added_by_id: '',
      image: 'https://static-cdn.jtvnw.net/ttv-boxart/105451_IGDB-272x380.jpg'),
];

class LatestScreen extends StatefulWidget {
  const LatestScreen({Key? key}) : super(key: key);

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
        child: Column(
          children: [
            // BU RSVP FIREBASE LOGIN İÇİN AMA YERİ BURASI DEĞİL
            // Consumer<AppStateManager>(
            //   builder: (context, appState, _) => Authentication(
            //     email: appState.email,
            //     loginState: appState.loginState,
            //     startLoginFlow: appState.startLoginFlow,
            //     verifyEmail: appState.verifyEmail,
            //     signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
            //     cancelRegistration: appState.cancelRegistration,
            //     registerAccount: appState.registerAccount,
            //     signOut: appState.signOut,
            //   ),
            // ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
// TODO: IMPLEMENT BUTTON BEHAVIOR
                  },
                  child: Row(
                    children: [
                      Text(
                        "Content Type",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        String.fromCharCode(
                            Icons.keyboard_arrow_down_outlined.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w200,
                          fontFamily:
                              Icons.keyboard_arrow_down_outlined.fontFamily,
                          package:
                              Icons.keyboard_arrow_down_outlined.fontPackage,
                        ),
                      ),
                    ],
                  ),
                  style: Theme.of(context).outlinedButtonTheme.style,
                ),
                SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {
// TODO: IMPLEMENT BUTTON BEHAVIOR
                  },
                  child: Row(
                    children: [
                      Text(
                        "People",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        String.fromCharCode(
                            Icons.keyboard_arrow_down_outlined.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w200,
                          fontFamily:
                              Icons.keyboard_arrow_down_outlined.fontFamily,
                          package:
                              Icons.keyboard_arrow_down_outlined.fontPackage,
                        ),
                      ),
                    ],
                  ),
                  style: Theme.of(context).outlinedButtonTheme.style,
                ),
                SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {
// TODO: IMPLEMENT BUTTON BEHAVIOR
                  },
                  child: Row(
                    children: [
                      Text(
                        "Topic",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        String.fromCharCode(
                            Icons.keyboard_arrow_down_outlined.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w200,
                          fontFamily:
                              Icons.keyboard_arrow_down_outlined.fontFamily,
                          package:
                              Icons.keyboard_arrow_down_outlined.fontPackage,
                        ),
                      ),
                    ],
                  ),
                  style: Theme.of(context).outlinedButtonTheme.style,
                ),
              ],
            ),
            Divider(
              thickness: 1,
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
