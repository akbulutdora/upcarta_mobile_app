import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:path/path.dart';

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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          titleSpacing: 0.0,
          title: Text(
            'Edit Profile',
            style: TextStyle(
                fontFamily: "SFCompactText-Medium",
                color: Theme.of(context).iconTheme.color,
                fontWeight: FontWeight.w500,
                fontSize: 22),
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
        create: (_) => EditProfileCubit(
            context.read<AuthenticationRepository>(),
            context.read<UserRepository>()),
        //  create: (context) => ProfileBloc(
        // userRepository: context.read<UserRepository>(), user: User.empty),
        // TODO: EMPTY USER OLMAYACAK
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(height * 0.016),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Credentials",
                    style: TextStyle(
                      fontFamily: "SFCompactText",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).dividerTheme.color,
                  ),
                  Text(
                    "Profile Image",
                    style: TextStyle(
                      fontFamily: "SFCompactText",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  InkWell(
                      child: CircleAvatar(
                        foregroundImage: context
                                    .read<UserBloc>()
                                    .state
                                    .user
                                    .photoURL !=
                                null
                            ? NetworkImage(
                                context.read<UserBloc>().state.user.photoURL!)
                            : null,
                        backgroundImage:
                            const AssetImage("assets/images/mock.jpg"),
                        //widget.user.profileImageUrl),
                        minRadius: 45.0,
                        maxRadius: 45.0,
                      ),
                      onTap: () async {
                        var value = await pickImage();
                        context.read<EditProfileCubit>().photoChanged(value);
                      }),
                  Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: "SFCompactText",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      fillColor: Colors.transparent,
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.all(height * 0.016),
                      border: Theme.of(context).inputDecorationTheme.border,
                    ),
                  ),
                  Text(
                    "Username",
                    style: TextStyle(
                      fontFamily: "SFCompactText",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  _UsernameInput(),
                  Text(
                    "Bio",
                    style: TextStyle(
                      fontFamily: "SFCompactText",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  const _BioInputForm(),
                  SizedBox(height: height * 0.012),
                  _BioSubmitButton(height: height),
                ],
              ),
            );
          },
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
                      padding: EdgeInsets.all(height * 0.02)),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontSize: height / 50),
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
            fillColor: Colors.transparent,
            filled: true,
            isDense: true,
            border: Theme.of(context).inputDecorationTheme.border,
          ),
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
        return TextField(
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
        );
      },
    );
  }
}
