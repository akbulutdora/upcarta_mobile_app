import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/onboarding/cubit/onboarding_cubit.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:path/path.dart';
import 'dart:io';



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
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 36.w, right: 36.w),
        child: BlocProvider(
          create: (_) => OnboardingCubit(context.read<UserRepository>()),
          child: BlocConsumer<OnboardingCubit, OnboardingState>(
            listener: (context, state) {
              if (state.status == OnboardingStatus.success) {
                context.router.push(const UserOnboarding1Route());
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 64.h),
                    _OnboardingTitle(),
                    SizedBox(height: 16.h),
                    // TODO: WHEN IMAGE IS UPDATED, WE NEED TO TRIGGER ONPRESSED, ONUPDATED ETC.
                    _PhotoInput(),
                    SizedBox(height: 24.h),
                    _UsernameInput(),
                    SizedBox(height: 12.h),
                    _UsernameError(),
                    SizedBox(height: 12.h),
                    _BioInput(),
                    SizedBox(height: 40.h),
                    _ButtonInput(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
class _UsernameError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state){
          return Align(alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Visibility(
                child: Text(state.username.value.fold((l) => l.failedValue, (r) => r).length>100 ? 'Enter a name with maximum 100 characters' : 'Enter a name consisting of numbers, capital or small letters', style: TextStyle(
                  fontFamily: 'SFCompactText-Regular.ttf',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ), textAlign: TextAlign.start),
                //FIXME: simplify returning textinput value
                visible: state.username.value.isLeft() && state.status != OnboardingStatus.initial, maintainSize: true, maintainAnimation: true, maintainState: true,),
            ),
          );
        });
  }
}
class _ButtonInput extends StatefulWidget {
  @override
  State<_ButtonInput> createState() => _ButtonInputState();
}

class _ButtonInputState extends State<_ButtonInput> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return
          Opacity(
            opacity: (state.username.value.isRight()) ? 1 : 0.2,
            child: IgnorePointer(
              ignoring: !state.username.value.isRight(),
              child: Container(
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
            ),
          );
      },
    );
  }
}
class _PhotoInput extends StatefulWidget {
  @override
  State<_PhotoInput> createState() => _PhotoInputState();
}

class _PhotoInputState extends State<_PhotoInput> {
  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  Future pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
    String fileName = basename(_image!.path);
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('uploads/$fileName');

    var downurl = await (await firebaseStorageRef.putFile(File(_image!.path)))
        .ref
        .getDownloadURL();
    var url = downurl.toString();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
              height: 150.h,
              child: Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () async {
                    var value = await pickImage();
                    context
                        .read<OnboardingCubit>()
                        .photoChanged(value);
                  },
                ),
              )),
        );
      },
    );
  }
}
class _OnboardingTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Text(
            'Create Your Profile',
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
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: TextField(
            key: const Key('signUpForm_usernameInput_textField'),
            onChanged: (username) =>
                context.read<OnboardingCubit>().usernameChanged(username),
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Username',
              fillColor: Colors.transparent,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
            ),
            minLines: 1,
            maxLines: 1,
          ),
        );
      },
    );
  }
}

class _BioInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<OnboardingCubit>().bioChanged(value),
      decoration: InputDecoration(
        labelText: 'Bio',
        alignLabelWithHint: true,
        fillColor: Colors.transparent,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0.r),
            borderSide: const BorderSide(
              color: Colors.white,
            )),
      ),
      keyboardType: TextInputType.multiline,
      minLines: 4, //Normal textInputField will be displayed
      maxLines: 4,
    );
  }
}
