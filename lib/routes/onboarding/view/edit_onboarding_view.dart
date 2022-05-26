import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';

// TODO: IMPLEMENT USER  BLOC WITH USER REPOSITORY WHICH WILL HANDLE
// TODO: OPERATIONS SUCH AS FOLLOW, UNFOLLOW, CHANGE PROFILE PIC

class EditOnboarding extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: EditOnboarding(),
    );
  }

  const EditOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  _EditOnboardingState createState() => _EditOnboardingState();
}

class _EditOnboardingState extends State<EditOnboarding> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(height * 0.016),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Edit Your Profile Information",
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
          SizedBox(height: height * 0.020),
          const Text(
            "Profile Image",
            style: TextStyle(
              fontFamily: "SFCompactText",
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: height * 0.016),
          const CircleImage(
            imageProvider: AssetImage("assets/images/mock.jpg"),
            //widget.user.profileImageUrl),
            imageRadius: 45.0,
          ),
          SizedBox(height: height * 0.020),
          const Text(
            "Bio",
            style: TextStyle(
              fontFamily: "SFCompactText",
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: height * 0.012),
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
          SizedBox(height: height * 0.020),
          Container(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              onPressed: () {
                context.router.push(const UserOnboarding1Route());
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.all(height * 0.02)),
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white, fontSize: height / 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
