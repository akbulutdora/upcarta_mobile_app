import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:auto_route/auto_route.dart';


class NewPostScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const NewPostScreen(),
    );
  }
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: Colors.amber,
        width: 100,
        height: 50,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'New Post',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),),
    );
  }
}
