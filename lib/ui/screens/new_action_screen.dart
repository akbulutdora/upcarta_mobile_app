import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:auto_route/auto_route.dart';

class NewPostScreen extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [(TextButton(onPressed: () {}, child: Text("Recommended Content", style: TextStyle(
              color: Colors.grey, fontSize: 18)))),
            (TextButton(onPressed: () {}, child: Text("Create New Collection", style: TextStyle(
                color: Colors.grey, fontSize: 18)))),
            (TextButton(onPressed: () {}, child: Text("Recommendation By Expert", style: TextStyle(
                color: Colors.grey, fontSize: 18)))),
            (TextButton(onPressed: () {}, child: Text("Collection By Expert", style: TextStyle(
                color: Colors.grey, fontSize: 18)))),
            (TextButton(onPressed: () {}, child: Text("Ask By Expert", style: TextStyle(
                color: Colors.grey, fontSize: 18)))),],
        ),
      ),
    );
  }
}
