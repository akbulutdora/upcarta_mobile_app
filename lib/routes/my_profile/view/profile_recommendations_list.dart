import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/bloc/latest_feed_bloc.dart';
import 'package:upcarta_mobile_app/routes/feed/latest/view/widgets/content_list_item.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';

class ProfileRecommendationsList extends StatelessWidget {
  const ProfileRecommendationsList({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state.status) {
          case UserStatus.failure:
            return Center(
                child: TextButton(
                    onPressed: () {
                      context
                          .read<UserBloc>()
                          .add(const UserEventRecommendationsFetched());
                    },
                    child: Text('failed to fetch recs')));
          case UserStatus.recommendedFetched:
            return const Center(child: CircularProgressIndicator());
          case UserStatus.success:
            if (state.recommendedContents.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return RefreshIndicator(
              onRefresh: () {
                return Future(
                  () => context
                      .read<UserBloc>()
                      .add(const UserEventRecommendationsFetched()),
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
