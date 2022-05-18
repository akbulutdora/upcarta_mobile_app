import 'package:flutter/material.dart';

class ProfileManager extends ChangeNotifier {
  // User get getUser => User(
  //       name: 'Mana',
  //       username: 'manaira',
  //       avatar: 'images/mock.jpg',
  //       bio:
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fermentum, a id nunc, odio augue enim. Viverra nullam pulvinar volutpat ultricies hendrerit sed. Morbi eget a nisi nulla vulputate vestibulum purus sodales.',
  //       id: 12345,
  //       email: 'mana@gmail.com',
  //       followers: 666,
  //       following: 666,
  //     );
  // User set setUser(User user);

  bool get didSelectUser => _didSelectUser;

  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _darkMode = false;

  void set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
