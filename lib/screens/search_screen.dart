// İDİL

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'package:upcarta_mobile_app/models/models.dart';

class SearchScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: UpcartaPages.searchPath,
      key: ValueKey(UpcartaPages.searchPath),
      child: const SearchScreen(),
    );
  }

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black,
      width: 50,
      height: 50,
      child: Padding(
        padding: EdgeInsets.all(100),
        child: MaterialButton(
          color: Colors.teal,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: const Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {

          },
        ),
      ),);
  }
}
