import 'package:flutter/material.dart';

import 'models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
    firstName: 'Mana',
    lastName: 'Irani',
    username: 'manaira', //how to put @ before?
    role: 'Flutterista',
    profileImageUrl: 'images/mock.jpg',
    points: 100,
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fermentum, a id nunc, odio augue enim. Viverra nullam pulvinar volutpat ultricies hendrerit sed. Morbi eget a nisi nulla vulputate vestibulum purus sodales.',
    darkMode: _darkMode,
  );

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