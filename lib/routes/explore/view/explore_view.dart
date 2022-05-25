import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/navigation/routes.gr.dart';
import 'package:upcarta_mobile_app/routes/explore/explore.dart';
import 'package:upcarta_mobile_app/ui_components/components.dart';
import 'package:upcarta_mobile_app/util/colors.dart';
import 'package:upcarta_mobile_app/util/styles.dart';
import '../../../models/auth_user.dart';

class ExploreScreen extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return const MaterialPage(child: ExploreScreen());
  }

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class Cat {
  String label = "";
  //Icon icon=Icon(Icons.person);
  bool isSelected = false;
  Cat(this.label, this.isSelected); //, this.icon
}

class _ExploreScreenState extends State<ExploreScreen> {
  late User user;

  final List<Cat> _catList = [
    Cat("All", false),
    Cat("Collections", false),
    Cat("People", false),
    Cat("Topics", false),
    Cat("Asks", false),
    Cat("Contents", false),
  ];

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
          width: 30,
          height: 30,
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
          create: (context) => ExploreCubit(),
          child: Column(
            children: [
              SizedBox(
                height: 32,
                child: buildSearchBar(),
              ),
              const SizedBox(height: 10),
              BlocListener<ExploreCubit, ExploreState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                child: BlocBuilder<ExploreCubit, ExploreState>(
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
                            Text("The user is typed ${state.searchKey}"),
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
                    } else if (state.status == ExploreStatus.success &&
                        state.searchKey != "") {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const WrappedSingleChip(),
                          ),
                          Center(
                              child: Text("The user typed ${state.searchKey}")),
                        ],
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
                    } else {
                      return const Center(
                        child: Text("Error"),
                      );
                    }
                  },
                ),
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

  List<Widget> catChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _catList.length; i++) {
      Widget item = FilterChip(
        label: SizedBox(
          height: 24,
          child: Text(_catList[i].label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "SFCompactText-Regular",
                  color: _catList[i].isSelected
                      ? AppColors.chip
                      : AppColors.secondary)),
        ),
        //avatar: _catList[i].icon,
        padding: const EdgeInsets.all(0.5),
        backgroundColor: Colors.transparent,
        shape: const StadiumBorder(side: BorderSide(color: Color(0xffDEDEDE))),
        disabledColor: AppColors.chip,
        selectedColor: AppColors.selected,
        showCheckmark: false,
        selected: _catList[i].isSelected,
        onSelected: (bool value) {
          setState(() {
            _catList[i].isSelected = value;
          });
        },
      );
      chips.add(item);
    }
    return chips;
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
            color: AppColors.edgeColor,
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
