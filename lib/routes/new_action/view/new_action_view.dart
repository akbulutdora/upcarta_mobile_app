import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

import '../../../navigation/routes.gr.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String dropdownvalue = 'Recommended Content';
  final _postInputController = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'Recommended Content',
    'Create New Collection',
    'Recommendation By Expert',
    'Collection By Expert',
    'Ask By Expert',
  ];
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/upcarta-logo-small.png",
          width: 30,
          height: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0.0,
        title: const Text(
          'New Action',
          style: TextStyle(
              fontFamily: "SFCompactText-Medium",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ));
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              SizedBox(height: height * .05),
              TextField(
                minLines: 1,
                maxLines: 3,
                controller: _postInputController,
                decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    labelText: 'Share your ideas...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              SizedBox(height: height * .05),
              _popUpDialog(),
            ],
          ),
        ),
      ),
    );
  }
}

class _popUpDialog extends StatelessWidget {
  const _popUpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      child: const Text(
        'Submit',
        style: TextStyle(
            fontFamily: "SFCompactText", color: Colors.white, fontSize: 18),
      ),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Action Complete'),
          content: const Text('Action Complete'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                context.router.push(HomeRoute());
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
