import 'package:flutter/material.dart';

class TopNavigationBar extends StatefulWidget {
  const TopNavigationBar({Key? key}) : super(key: key);

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    int _currentPageIndex = 0;
    List<NavigationDestination> destinations = [
      const NavigationDestination(
        icon: Text("Item1"),
        label: "Item1",
      ),
      const NavigationDestination(
        icon: Text("Item2"),
        label: 'Commute',
      ),
      const NavigationDestination(
        icon: Text("Item3"),
        label: 'Saved',
      ),
    ];
    return
      NavigationBar(
        // selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        // unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 48,
          onDestinationSelected: (int index) {
            setState(() { _currentPageIndex = index; });
          },
          selectedIndex: _currentPageIndex,
          destinations: destinations);
  }
}
