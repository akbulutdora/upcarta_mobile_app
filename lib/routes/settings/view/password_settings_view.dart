import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/util/view_paths.dart';

import '../../../repositories/authentication_repository.dart';
import '../../../repositories/user_repository.dart';
import '../cubit/password_settings_cubit.dart';

class PasswordSettings extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: PasswordSettings(),
    );
  }

  const PasswordSettings({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordSettingsState createState() => _PasswordSettingsState();
}

class _PasswordSettingsState extends State<PasswordSettings> {
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
              'Password Settings',
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
            create: (context) => PasswordSettingsCubit(
                context.read<AuthenticationRepository>(),
                context.read<UserRepository>()),
            child: Container(
                padding: EdgeInsets.all(height * 0.016),
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).dividerTheme.color,
                    ),
                    SizedBox(height: height * 0.020),
                    Text(
                      "New Password",
                      style: TextStyle(
                        fontFamily: "SFCompactText",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    SizedBox(height: height * 0.012),
                    _PasswordInput(),
                    SizedBox(height: height * 0.020),
                    _PasswordSubmitButton(height: height),
                  ],
                ))));
  }
}

class _PasswordSubmitButton extends StatelessWidget {
  const _PasswordSubmitButton({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordSettingsCubit, PasswordSettingsState>(
      listener: (context, state) {
        if (state.status == PasswordSettingsStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Password successfully changed!'),
              ),
            );
          AutoRouter.of(context).pop();
        } else if (state.status == PasswordSettingsStatus.submissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Password Change Failure'),
              ),
            );
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == PasswordSettingsStatus.submitting
            ? const CircularProgressIndicator()
            : Container(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    context
                        .read<PasswordSettingsCubit>()
                        .changePasswordSubmitted();
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(height * 0.02)),
                  child: Text(
                    'Save',
                    style:
                        TextStyle(color: Colors.white, fontSize: height / 50),
                  ),
                ),
              );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordSettingsCubit, PasswordSettingsState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('passwordSettingsForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<PasswordSettingsCubit>().passwordChanged(password),
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Enter New Password',
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
