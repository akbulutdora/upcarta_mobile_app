import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/view/widgets/content_list_item.dart';
import 'package:upcarta_mobile_app/routes/library/bloc/library_bloc.dart';

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
          padding: EdgeInsets.fromLTRB(16.0.w, 16.0.w, 8.0.h, 0),
          child: Column(
            children: <Widget>[
              BlocBuilder<LibraryBloc, LibraryState>(
                builder: (context, state) {
                  switch (state.status) {
                    case LibraryStatus.failure:
                      return const Center(child: Text('failed to fetch posts'));
                    case LibraryStatus.success:
                      if (state.contents.isEmpty) {
                        return RefreshIndicator(
                            onRefresh: () {
                              return Future(
                                () => context
                                    .read<LibraryBloc>()
                                    .add(LibraryEventContentFetched()),
                              );
                            },
                            child: SizedBox(
                              height: 605.h,
                              child: ListView(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(), //ScrollableScrollPhysics(),
                                  // itemBuilder: (BuildContext context, int index) {
                                  children: const [
                                    Center(child: Text('No Posts'))
                                  ]
                                  // },
                                  ),
                            ));
                      }
                      return RefreshIndicator(
                        onRefresh: () {
                          return Future(
                            () => context
                                .read<LibraryBloc>()
                                .add(LibraryEventContentFetched()),
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
