import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/app/bloc/app_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/onboarding/cubit/onboarding_cubit.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';
import 'package:path/path.dart';
import 'dart:io';

import '../../profile/bloc/profile_bloc.dart';

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

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
    String fileName = basename(_image!.path);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');

    var downurl = await (await firebaseStorageRef.putFile(File(_image!.path))).ref.getDownloadURL();
    var url = downurl.toString();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.only(left: 36.w, right: 36.w),
        child: BlocProvider(
          create: (_) => OnboardingCubit(context.read<UserRepository>()),
          child: BlocConsumer<OnboardingCubit, OnboardingState>(
            listener: (context, state) {
              if (state.status == OnboardingStatus.success) {
                context.router.push(const UserOnboarding1Route());
              }
              else if (state.status == OnboardingStatus.submissionFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage ?? 'Username Change Failure'),
                  ),
                );
            }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 64.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Create Your Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.transparent, // Step 2 SEE HERE
                            shadows: [
                              Shadow(
                                  offset: Offset(0, -10.sp),
                                  color: Theme.of(context).iconTheme.color!)
                            ],
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor,
                            decorationThickness: 2.sp),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // TODO: WHEN IMAGE IS UPDATED, WE NEED TO TRIGGER ONPRESSED, ONUPDATED ETC.
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 16.h,
                          child:Material(
                            shape: CircleBorder(),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              splashColor: Colors.black26,
                              onTap:() async {var value = await pickImage();
                              context.read<OnboardingCubit>().photoChanged(value);
                              },
                            ),
                          )
                      ),

                    ),

                    SizedBox(height: 24.h),
                    _UsernameInput(),
                    SizedBox(height: 24.h),
                    _BioInput(),
                    SizedBox(height: 40.h),
                    Container(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        onPressed: () {
                          context
                              .read<OnboardingCubit>()
                              .submitBioPhotoURLUsername();
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            side: BorderSide(color: AppColors.upcartaBlue),
                            backgroundColor: AppColors.white,
                            padding:
                            EdgeInsets.fromLTRB(32.w, 10.h, 32.w, 10.h)),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: AppColors.upcartaBlue, fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ],
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
                // TODO: WHEN IMAGE IS UPDATED, WE NEED TO TRIGGER ONPRESSED, ONUPDATED ETC.
                const CircleImage(
                  imageProvider: AssetImage("assets/images/mock.jpg"),
                  //widget.user.profileImageUrl),
                  imageRadius: 45.0,
                ),

                SizedBox(height: height * 0.020),

                const Text(
                  "Username",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                _UsernameInput(),
                const SizedBox(
                  height: 8,
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
                SizedBox(height: height * 0.012),
                TextField(
                  onChanged: ((value) =>
                      context.read<OnboardingCubit>().bioChanged(value)),
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
                      context
                          .read<OnboardingCubit>()
                          .submitBioPhotoURLUsername();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.lightBlue,
                        padding: EdgeInsets.all(height * 0.02)),
                    child: Text(
                      'Continue',
                      style:
                          TextStyle(color: Colors.white, fontSize: height / 50),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String username = context.read<AppBloc>().state.user.email!.split('@')[0]+"user";
    final TextEditingController _controller = TextEditingController(text: username); //context.read<ProfileBloc>().state.user.username!
    context.read<OnboardingCubit>().usernameChanged(username);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          controller: _controller,
          key: const Key('signUpForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<OnboardingCubit>().usernameChanged(username),
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Username',
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
          ),
        );
      },
    );
  }
}
