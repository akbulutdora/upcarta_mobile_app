import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/onboarding/cubit/onboarding_cubit.dart';
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
      child: BlocProvider(
        create: (_) => OnboardingCubit(context.read<UserRepository>()),
        child: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            if (state.status == OnboardingStatus.success) {
              context.router.push(const UserOnboarding1Route());
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Edit Your Profile Information",
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
                SizedBox(height: height * 0.020),
                 Text(
                  "Profile Image",
                  style: TextStyle(
                    fontFamily: "SFCompactText",
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Theme.of(context).iconTheme.color,
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
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
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
