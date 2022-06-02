import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/new_action/cubit/new_action_cubit.dart';

import '../../../navigation/routes.gr.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String dropdownvalue = 'Recommended Content';

  // List of items in our dropdown menu
  var items = [
    'Recommended Content',
    'Create New Collection',
    'Recommendation By Expert',
    'Collection By Expert',
    'Ask By Expert',
  ];
  _NewPostScreenState createState() => _NewPostScreenState();
  @override
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
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
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
          child: BlocProvider(
            create: (context) => NewActionCubit(context.read<UserRepository>()),
            child: BlocListener<NewActionCubit, NewActionState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state.status == ActionStatus.success) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text("SUCCESS"),
                      ),
                    );
                }
                if (state.status == ActionStatus.submissionFailure) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Failure'),
                      ),
                    );
                }
              },
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
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
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
                  const TitleForm(),
                  const SizedBox(
                    height: 8,
                  ),
                  const URLForm(),
                  SizedBox(height: height * .05),
                  const _PopUpDialog(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class URLForm extends StatelessWidget {
  const URLForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<NewActionCubit>().contentChanged(value);
      },
      minLines: 1,
      maxLines: 3,
      decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          labelText: 'Enter URL',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 18)),
    );
  }
}

class TitleForm extends StatelessWidget {
  const TitleForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<NewActionCubit>().titleChanged(value);
      },
      minLines: 1,
      maxLines: 3,
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
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 18)),
    );
  }
}

class _PopUpDialog extends StatelessWidget {
  const _PopUpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewActionCubit, NewActionState>(
      builder: (context, state) {
        return state.status == ActionStatus.submitting
            ? const CircularProgressIndicator()
            : MaterialButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      fontFamily: "SFCompactText",
                      color: Colors.white,
                      fontSize: 18),
                ),
                onPressed: () {
                  context.read<NewActionCubit>().submitContent();
                },
              );
      },
    );
  }
}
