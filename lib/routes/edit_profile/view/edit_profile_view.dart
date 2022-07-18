import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:path/path.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: AppBar(
          elevation: 0.8,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          titleSpacing: 0.0,
          title: Text(
            'Edit Profile',
            style: kAppBarTitleTextStyle,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              context.router.pop();
            },
          )),
      //),
      body: BlocProvider(
        create: (_) => UserBloc(
            authRepository: context.read<AuthenticationRepository>(),
            userRepository: context.read<UserRepository>()),
        child: BlocProvider(
          create: (_) => EditProfileCubit(
              context.read<UserRepository>()),
          //  create: (context) => ProfileBloc(
          // userRepository: context.read<UserRepository>(), user: User.empty),
          // TODO: EMPTY USER OLMAYACAK
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Credentials',
                        style: TextStyle(
                          fontFamily: 'SFCompactText',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).dividerTheme.color,
                      ),
                      SizedBox(height: 16.h),
                      InkWell(
                          child: CircleAvatar(
                            foregroundImage:
                                context.read<UserBloc>().state.user.photoURL !=
                                        null
                                    ? NetworkImage(context
                                        .read<UserBloc>()
                                        .state
                                        .user
                                        .photoURL!)
                                    : null,
                            backgroundImage:
                                const AssetImage('assets/images/mock.jpg'),
                            //widget.user.profileImageUrl),
                            minRadius: 45.0,
                            maxRadius: 45.0,
                          ),
                          onTap: () async {
                            var value = await pickImage();
                            context
                                .read<EditProfileCubit>()
                                .photoChanged(value);
                          }),
                      SizedBox(height: 24.h),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          fillColor: Colors.transparent,
                          filled: true,
                          isDense: true,
                          contentPadding: EdgeInsets.all(16.h),
                          border: Theme.of(context).inputDecorationTheme.border,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      _UsernameInput(),
                      SizedBox(height: 16.h),
                      const _BioInputForm(),
                      SizedBox(height: 16.h),
                      _BioSubmitButton(height: 40.h),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BioSubmitButton extends StatelessWidget {
  const _BioSubmitButton({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.status == EditProfileStatus.success) {
          AutoRouter.of(context).pop();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == EditProfileStatus.submitting
            ? const CircularProgressIndicator()
            : Container(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    context.read<EditProfileCubit>().editProfileSubmitted();
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 8.h)),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Theme.of(context).floatingActionButtonTheme.foregroundColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              );
      },
    );
  }
}

class _BioInputForm extends StatelessWidget {
  const _BioInputForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) => previous.bio != current.bio,
      builder: (context, state) {
        return TextField(
          key: const Key('editProfileForm_bioInput_textField'),
          onChanged: (bio) {
            context.read<EditProfileCubit>().bioChanged(bio);
          },
          decoration: InputDecoration(
            labelText: 'Bio',
            alignLabelWithHint: true,
            fillColor: Colors.transparent,
            filled: true,
            isDense: true,
            border: Theme.of(context).inputDecorationTheme.border,
          ),
          keyboardType: TextInputType.multiline,
          minLines: 4, //Normal textInputField will be displayed
          maxLines: 4,
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: TextField(
            key: const Key('signUpForm_usernameInput_textField'),
            onChanged: (username) =>
                context.read<EditProfileCubit>().usernameChanged(username),
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Username',
              fillColor: Colors.transparent,
              filled: true,
              border: Theme.of(context).inputDecorationTheme.border,
            ),
          ),
        );
      },
    );
  }
}
