import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/ui/components/circle_image.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';

class EditProfileScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: EditProfileScreen(),
    );
  }

  const EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          title: const Text(
            'Edit Profile',
            style: TextStyle(
                fontFamily: "SFCompactText-Medium",
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black26,
            ),
            onPressed: () {
              context.router.pop();
            },
          )),
      //),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Connect Accounts",
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.all(height * 0.03)),
                child: Text(
                  'Connect to Twitter',
                  style: TextStyle(color: Colors.white, fontSize: height / 60),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.all(height * 0.03)),
                child: Text(
                  'Connect to Google',
                  style: TextStyle(color: Colors.white, fontSize: height / 60),
                ),
              ),
            ]),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(height: height * 0.016),
            const Text(
              "Credentials",
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Text(
              "Profile Image",
            ),
            CircleImage(
              imageProvider: AssetImage("assets/images/mock.jpg"),
              //widget.user.profileImageUrl),
              imageRadius: 45.0,
            ),
            const Text(
              "Name",
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                fillColor: Colors.transparent,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.all(height * 0.016),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )),
              ),
            ),
            const Text(
              "Username",
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                fillColor: Colors.transparent,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.all(height * 0.016),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )),
              ),
            ),
            const Text(
              "Bio",
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Bio',
                fillColor: Colors.transparent,
                filled: true,
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: height * 0.016),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.all(height * 0.03)),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: height / 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
