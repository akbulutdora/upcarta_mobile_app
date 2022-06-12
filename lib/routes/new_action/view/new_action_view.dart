import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/app/app.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/new_action/cubit/new_action_cubit.dart';

import '../../../navigation/routes.gr.dart';
import '../../../ui_components/DropDown_NewPost.dart';
import '../../../util/colors.dart';

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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
          child: Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                          splashRadius: 32.r,
                          iconSize: 28.0,
                          icon: Icon(Icons.book_outlined),
                          onPressed: () {}),
                      IconButton(
                        splashRadius: 32.r,
                        iconSize: 28.0,
                        icon: Icon(Icons.article_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        splashRadius: 32.r,
                        iconSize: 28.0,
                        icon: Icon(Icons.ac_unit),
                        onPressed: () {},
                      ),
                      IconButton(
                        splashRadius: 32.r,
                        iconSize: 28.0,
                        icon: Icon(Icons.video_call_outlined),
                        onPressed: () {},
                      ),
                    ]),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        splashRadius: 32.r,
                        iconSize: 28.0,
                        icon: Icon(Icons.movie_creation_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        splashRadius: 32.r,
                        iconSize: 28.0,
                        icon: Icon(Icons.tv_outlined),
                        onPressed: () {},
                        //Content type
                        //Image
                        //topic
                        //Description
                      ),
                      IconButton(
                          splashRadius: 32.r,
                          iconSize: 28.0,
                          icon: Icon(Icons.podcasts_outlined),
                          onPressed: () {}),
                      IconButton(
                        splashRadius: 32.r,
                        iconSize: 28.0,
                        icon: Icon(Icons.audiotrack_outlined),
                        onPressed: () {},
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 42.h, 16.w, 0.h),
          child: Column(
            children: [
              BlocProvider(
                create: (_context) =>
                    NewActionCubit(context.read<UserRepository>()),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.close,
                                color: AppColors.gray3ContentText, size: 30.sm),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 270.w,
                          height: 50.h,
                          padding: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                color: AppColors.upcartaBlue,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: CustDropDown(
                            items: [
                              CustDropdownMenuItem(
                                value: 0,
                                child: Text(
                                  'Recommended Content',
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              ),
                              CustDropdownMenuItem(
                                value: 0,
                                child: Text('Create New Collection',
                                    style: TextStyle(fontSize: 15.sp)),
                              ),
                              CustDropdownMenuItem(
                                value: 0,
                                child: Text('Recommendation By Expert',
                                    style: TextStyle(fontSize: 15.sp)),
                              ),
                              CustDropdownMenuItem(
                                value: 0,
                                child: Text('Collection By Expert',
                                    style: TextStyle(fontSize: 15.sp)),
                              ),
                              CustDropdownMenuItem(
                                value: 0,
                                child: Text('Ask By Expert',
                                    style: TextStyle(fontSize: 15.sp)),
                              )
                            ],
                            hintText: "Select Action",
                            borderRadius: 10.r,
                            onChanged: (val) {
                              print(val);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextField(
                        onChanged: (value) {
                          context.read<NewActionCubit>().titleChanged(value);
                        },
                        enableSuggestions: false,
                        autocorrect: false,
                        minLines: 1,
                        maxLines: 2,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600),
                        cursorColor: AppColors.upcartaBlue,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: AppColors.gray3ContentText,
                          ),
                          hintText: "Add a Title",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Divider(
                        color: AppColors.upcartaBlue,
                        indent: 8.w,
                        height: 0.h,
                      ),
                      TextField(
                        onChanged: (value) {
                          context.read<NewActionCubit>().contentChanged(value);
                        },
                        enableSuggestions: false,
                        autocorrect: false,
                        minLines: 1,
                        maxLines: 5,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                        cursorColor: AppColors.upcartaBlue,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: AppColors.gray3ContentText,
                          ),
                          hintText: "Add optional body text...",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      SizedBox(height: 75.h, child: const URLForm()),
                      SizedBox(height: 32.h),
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: _SendButton()),
                    ],
                  ),
                ),
              ),
            ],
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
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 15.sp, color: AppColors.black),
        onChanged: (value) {
          context.read<NewActionCubit>().urlChanged(value);
        },
        minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            labelText: 'Enter URL',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 15.sp)),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewActionCubit, NewActionState>(
      builder: (context, state) {
        return state.status == ActionStatus.submitting
            ? const CircularProgressIndicator()
            : OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    backgroundColor: AppColors.white,
                    side: BorderSide(color: AppColors.upcartaBlue)),
                onPressed: () {
                  context.read<NewActionCubit>().submitContent();
                },
                child: Text(
                  'Send',
                  style: TextStyle(
                      color: AppColors.upcartaBlue,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
              );
      },
    );
  }
}
