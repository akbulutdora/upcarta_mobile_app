import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/view/widgets/content_list_item.dart';
import 'package:upcarta_mobile_app/routes/library/bloc/library_bloc.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import 'package:upcarta_mobile_app/util/constants.dart';

class MyLibrarySavedScreen extends StatefulWidget {
  const MyLibrarySavedScreen({Key? key}) : super(key: key);

  @override
  State<MyLibrarySavedScreen> createState() => _MyLibrarySavedScreenState();
}

class _MyLibrarySavedScreenState extends State<MyLibrarySavedScreen> {
  late List<String> selectedChips = ['All'];
  bool isAllSelected = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 8.0.h),
          child: Column(
            children: <Widget>[
              BlocBuilder<LibraryBloc, LibraryState>(
                builder: (context, state) {
                  switch (state.status) {
                    case LibraryStatus.failure:
                      return const Center(child: Text('failed to fetch posts'));
                    case LibraryStatus.success:
                      if (state.contents.isEmpty) {
                        return const Center(child: Text('no posts'));
                      }
                      return RefreshIndicator(
                        onRefresh: () {
                          return Future(
                            () => context
                                .read<LibraryBloc>()
                                .add(LibraryEventContentRefreshed()),
                          );
                        },
                        child: SizedBox(
                          // FIXME: FIX SIZE
                          height: 605.h,
                          child: ListView.builder(
                              physics:
                                  const AlwaysScrollableScrollPhysics(), //ScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return ContentListItem(
                                    content: state.contents[index]);
                              },
                              itemCount: state.contents.length),
                        ),
                      );

                    default:
                      return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
