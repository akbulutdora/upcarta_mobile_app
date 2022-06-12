import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/bloc/latest_feed_bloc.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/view/widgets/bottom_loader.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/view/widgets/content_list_item.dart';
import 'package:upcarta_mobile_app/ui_components/feed_content_list.dart';

class LatestContentList extends StatefulWidget {
  const LatestContentList({Key? key}) : super(key: key);

  @override
  _LatestContentListState createState() => _LatestContentListState();
}

class _LatestContentListState extends State<LatestContentList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestFeedBloc, LatestFeedState>(
      builder: (context, state) {
        switch (state.status) {
          case LatestFeedStatus.failure:
            return Center(
                child: TextButton(
                    onPressed: () {
                      context
                          .read<LatestFeedBloc>()
                          .add(LatestFeedEventContentRefreshed());
                    },
                    child: const Text('failed to fetch posts')));
          case LatestFeedStatus.success:
            if (state.contents.isEmpty) {
              return Center(
                  child: TextButton(
                      onPressed: () => context
                          .read<LatestFeedBloc>()
                          .add(LatestFeedEventContentRefreshed()),
                      child: const Text('no posts')));
            }
            return RefreshIndicator(
              onRefresh: () {
                return Future(
                  () => context
                      .read<LatestFeedBloc>()
                      .add(LatestFeedEventContentRefreshed()),
                );
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.contents.length
                      ? const BottomLoader()
                      : ContentListItem(content: state.contents[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.contents.length
                    : state.contents.length + 1,
                controller: _scrollController,
              ),
            );

          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<LatestFeedBloc>().add(LatestFeedEventContentFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
