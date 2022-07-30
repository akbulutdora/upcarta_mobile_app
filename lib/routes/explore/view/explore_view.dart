// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/query_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/explore/explore.dart';
import 'package:upcarta_mobile_app/routes/my_profile/bloc/user_bloc.dart';
import 'package:upcarta_mobile_app/routes/other_profile/bloc/other_profile_bloc.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';

class ExploreScreen extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return const MaterialPage(child: ExploreScreen());
  }

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Widget> cardsList = const <Widget>[
    ExploreCard(
      text: 'Featured Collections',
      route: SeeAllFeaturedCollectionsRoute(),
    ),
    ExploreCard(
      text: 'Inspiring People',
      route: SeeAllInspiringPeopleRoute(),
    ),
    ExploreCard(
      text: 'Popular Topics',
      route: SeeAllPopularTopicsRoute(),
    ),
    ExploreCard(
      text: 'Recent Asks',
      route: SeeAllRecentAsksRoute(),
    ),
    ExploreCard(
      text: 'Archived Content',
      route: SeeAllContentArchiveViewRoute(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/upcarta-logo-small.png',
          width: 30.w,
          height: 30.h,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: 0.8,
        titleSpacing: 0.0,
        title: Text(
          'Explore',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: BlocProvider(
            // TODO: INJECT PROPERLY
            // FIXME: FIX SEARCH BEHAVIOR
            create: (context) => ExploreCubit(
                QueryRepository(firebaseFirestore: FirebaseFirestore.instance),
                context.read<UserRepository>()),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                  child: buildSearchBar(),
                ),
                const SizedBox(height: 10),
                BlocBuilder<ExploreCubit, ExploreState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status ||
                      previous.searchKey != current.searchKey,
                  builder: (context, state) {
                    if (state.status == ExploreStatus.submitting) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text('The user is typing ${state.searchKey}'),
                            const SizedBox(
                              height: 10,
                            ),
                              CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                              )
                          ],
                        ),
                      );
                    } else if (state.status == ExploreStatus.initial ||
                        state.searchKey == '') {
                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        children: cardsList,
                      );
                    } else if (state.status == ExploreStatus.typing) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text('The user is typing ${state.searchKey}'),
                            const SizedBox(
                              height: 10,
                            ),
                               CircularProgressIndicator(
                                valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)
                              ),
                          ],
                        ),
                      );
                    } else if (state.status == ExploreStatus.error) {
                      return const Center(
                        child: Text('Error'),
                      );
                    } else {
                      // else if (state.status == ExploreStatus.success &&
                      //     state.searchKey != "") {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const WrappedSingleChip(),
                          ),

                          Text('People',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'SF Compact Text',
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SearchResultList(
                            searchResult: state.searchPeople,
                          ),

                          Text('Collections',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'SF Compact Text',
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SearchResultList(
                            searchResult: state.searchPeople,
                          ),

                          Text('Contents',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'SF Compact Text',
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SearchResultList(
                            searchResult: state.searchPeople,
                          ),

                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        return TextField(
          onSubmitted: (value) {
            context.read<ExploreCubit>().submitSearch();
          },
          onChanged: (value) async {
            context.read<ExploreCubit>().searchKeyChanged(value);
            await Future.delayed(const Duration(seconds: 1));
            context.read<ExploreCubit>().submitSearch();
          },
          onEditingComplete: () {
            context.read<ExploreCubit>().submitSearch();
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
            hintText: 'Content, people, topic, collection, or ask',
            hintStyle: TextStyle(
                fontFamily: 'SFCompactText-Regular',
                color: Color(0xff949494),
                fontWeight: FontWeight.w400,
                fontSize: 13),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        );
      },
    );
  }
}

class SearchResultList extends StatelessWidget {
  final List searchResult;
  const SearchResultList({
    Key? key,
    required this.searchResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppUser currentUser = context.read<UserBloc>().state.user;
    bool isAll = true;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 230,
            child: Expanded(
              child: BlocListener<OtherProfileBloc, OtherProfileState>(
                listener: ((context, state) {
                  switch (state.status) {
                    case OtherProfileStatus.success:
                      AutoRouter.of(context).push(const OtherProfileScreenRoute());
                      // .push(OtherProfileScreenRoute(uid: state.user.id));
                      // context
                      //     .read<OtherProfileBloc>()
                      //     .add(OtherProfileEventFetched(state.user.id));
                      break;
                    default:
                      break;
                  }
                }),
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      AppUser item = searchResult[index];
                      return BlocBuilder<OtherProfileBloc, OtherProfileState>(
                        builder: (context, state) {
                          if (state.status == ExploreStatus.followRequested) {
                            return const CircularProgressIndicator();
                          }

                          bool isNotFollowing =
                              currentUser.followingIDs != null &&
                                  !currentUser.followingIDs!.contains(item.id);
                          if (kDebugMode) {
                            print(
                              'FIRST IS  ${state.user.id} AND SECOND IS ${item.id}');
                          }

                          return ListTile(
                            leading: IconButton(
                                onPressed: isNotFollowing
                                    ? (() {
                                        BlocProvider.of<ExploreCubit>(context)
                                            .followRequested(item.id);
                                      })
                                    : (() {
                                        BlocProvider.of<ExploreCubit>(context)
                                            .unfollowRequested(item.id);
                                      }),
                                icon: Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: isNotFollowing
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).dividerTheme.color,
                                )),
                            trailing: TextButton(
                              child: Text(item.name ?? 'null name'),
                              onPressed: () {
                                // AutoRouter.of(context)
                                //     .push(OtherProfileScreenRoute(uid: item.id));
                                // context.read<OtherProfileBloc>().add(
                                //     OtherProfileEventRecommendationsFetched(
                                //         item));
                                context
                                    .read<OtherProfileBloc>()
                                    .add(OtherProfileEventFetched(item.id));
                              },
                            ),
                            title: Text(item.email ?? 'null email'),
                            isThreeLine: true,
                            subtitle: Text('@' + item.username!),
                            dense: true,
                          );

                        },
                      );
                    },
                    itemCount: isAll ? 3 : searchResult.length,
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}

class ExploreCardsGrid extends StatelessWidget {
  const ExploreCardsGrid({
    Key? key,
    required this.cardsList,
  }) : super(key: key);

  final List<Widget> cardsList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return cardsList[index];
        },
        childCount: cardsList.length,
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  final String text;
  final PageRouteInfo<dynamic> route;
  const ExploreCard({
    Key? key,
    required this.text,
    required this.route,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // AutoRouter.of(context).push(route);
        context.read<ExploreCubit>().searchKeyChanged(text);
        context.read<ExploreCubit>().submitSearch();
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).dividerTheme.color!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Text(
            text,
            style: exploreCardsFont,
          ),
        ),
      ),
    );
  }
}
