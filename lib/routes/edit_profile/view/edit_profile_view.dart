import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';

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
        padding: EdgeInsets.all(height * 0.016),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Credentials",
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Text(
              "Profile Image",
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const CircleImage(
              imageProvider: AssetImage("assets/images/mock.jpg"),
              //widget.user.profileImageUrl),
              imageRadius: 45.0,
            ),
            const Text(
              "Name",
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
              ),
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
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
              ),
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
              style: TextStyle(
                fontFamily: "SFCompactText",
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
              ),
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
            SizedBox(height: height * 0.012),
            Container(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.all(height * 0.02)),
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: height / 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
