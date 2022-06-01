import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/repositories/query_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/explore/explore.dart';
import 'package:upcarta_mobile_app/routes/profile/bloc/profile_bloc.dart';
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
      text: "Featured Collections",
      route: SeeAllFeaturedCollectionsRoute(),
    ),
    ExploreCard(
      text: "Inspiring People",
      route: SeeAllInspiringPeopleRoute(),
    ),
    ExploreCard(
      text: "Popular Topics",
      route: SeeAllPopularTopicsRoute(),
    ),
    ExploreCard(
      text: "Recent Asks",
      route: SeeAllRecentAsksRoute(),
    ),
    ExploreCard(
      text: "Archived Content",
      route: SeeAllContentArchiveViewRoute(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/upcarta-logo-small.png",
          width: 30.w,
          height: 30.h,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0.0,
        title: const Text(
          'Explore',
          style: TextStyle(
              fontFamily: "SFCompactText-Medium",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BlocProvider(
          // TODO: INJECT PROPERLY
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
                          Text("The user is typing ${state.searchKey}"),
                          const SizedBox(
                            height: 10,
                          ),
                          const CircularProgressIndicator(),
                        ],
                      ),
                    );
                  } else if (state.status == ExploreStatus.initial ||
                      state.searchKey == "") {
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
                          Text("The user is typing ${state.searchKey}"),
                          const SizedBox(
                            height: 10,
                          ),
                          const CircularProgressIndicator(),
                        ],
                      ),
                    );
                  } else if (state.status == ExploreStatus.error) {
                    return const Center(
                      child: Text("Error"),
                    );
                  } else {
                    // else if (state.status == ExploreStatus.success &&
                    //     state.searchKey != "") {
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const WrappedSingleChip(),
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
    );
  }

  Widget buildSearchBar() {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        return TextField(
          onSubmitted: ((value) {
            context.read<ExploreCubit>().submitSearch();
          }),
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
                fontFamily: "SFCompactText-Regular",
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
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 500,
            child: Expanded(
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    AppUser item = searchResult[index];
                    return BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state.status == ExploreStatus.followRequested) {
                          return const CircularProgressIndicator();
                        }
                        if (state.user.followingIDs != null &&
                            !state.user.followingIDs!.contains(item.id)) {
                          print(
                              "\n\nTHE USER AT BLOC ${state.user.toString()}");
                          return ListTile(
                            leading: IconButton(
                                onPressed: (() {
                                  BlocProvider.of<ExploreCubit>(context)
                                      .followRequested(item.id);
                                }),
                                icon: Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: AppColors.primary,
                                )),
                            trailing: Text(item.name ?? "null name"),
                            title: Text(item.email ?? "null email"),
                            isThreeLine: true,
                            subtitle: Text(item.username ?? "null username"),
                            dense: true,
                          );
                        } else {
                          return ListTile(
                            leading: IconButton(
                                onPressed: (() {
                                  BlocProvider.of<ExploreCubit>(context)
                                      .unfollowRequested(item.id);
                                }),
                                icon: const Icon(
                                    Icons.add_circle_outline_rounded)),
                            trailing: Text(item.name ?? "null name"),
                            title: Text(item.email ?? "null email"),
                            isThreeLine: true,
                            subtitle: Text(item.username ?? "null username"),
                            dense: true,
                          );
                        }
                      },
                    );
                  },
                  itemCount: searchResult.length),
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
            color: AppColors.gray2LightText,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: Text(
            text,
            style: exploreCardsFont,
          ),
        ),
      ),
    );
  }
}
