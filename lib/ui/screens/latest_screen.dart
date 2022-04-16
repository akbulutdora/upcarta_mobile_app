import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/components/feed_content_list.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upcarta_mobile_app/src/authentication.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../../util/styles.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final List<Content> contents = <Content>[
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
            const Divider(
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
                      const Text(
                        "Content Type",
                        style: kTextStyle9,
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
                  style: outlinedButtonStyle,
                ),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {
                    // TODO: IMPLEMENT BUTTON BEHAVIOR
                  },
                  child: Row(
                    children: [
                      const Text(
                        "People",
                        style: kTextStyle9,
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
                  style: outlinedButtonStyle,
                ),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {
                    // TODO: IMPLEMENT BUTTON BEHAVIOR
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Topic",
                        style: kTextStyle9,
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
                  style: outlinedButtonStyle,
                ),
              ],
            ),
            const Divider(
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
