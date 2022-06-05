import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/view/widgets/content_list_item.dart';
import 'package:upcarta_mobile_app/routes/other_profile/other_profile.dart';

class OtherProfileRecommendationsList extends StatelessWidget {
  const OtherProfileRecommendationsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherProfileBloc, OtherProfileState>(
      builder: (context, state) {
        switch (state.status) {
          case OtherProfileStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case OtherProfileStatus.recommendedFetched:
            return const Center(child: CircularProgressIndicator());
          case OtherProfileStatus.fetchSuccess:
            if (state.recommendedContents.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return RefreshIndicator(
              onRefresh: () {
                return Future(
                  () => context
                      .read<OtherProfileBloc>()
                      .add(OtherProfileEventRecommendationsFetched(state.user)),
                );
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ContentListItem(
                      content: state.recommendedContents[index]);
                },
                itemCount: state.recommendedContents.length,
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
