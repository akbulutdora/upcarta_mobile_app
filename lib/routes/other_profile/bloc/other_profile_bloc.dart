import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/models/user.dart';
import 'package:upcarta_mobile_app/repositories/query_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'other_profile_event.dart';
part 'other_profile_state.dart';

class OtherProfileBloc extends Bloc<OtherProfileEvent, OtherProfileState> {
  late final StreamSubscription<AppUser>? _userSubscription;
  final QueryRepository _queryRepository;

  OtherProfileBloc({
    required QueryRepository queryRepository,
  })  : _queryRepository = queryRepository,
        super(const OtherProfileState()) {
    // on<OtherProfileEventChanged>(_onChanged);
    on<OtherProfileEventFetched>(_onUserFetched);
    on<OtherProfileEventRecommendationsFetched>(_onContentFetched);
    // _userSubscription =
    //     _userRepository.user.listen((user) => add(OtherProfileEventChanged(
    //           user,
    //         )));
  }

  Future _onUserFetched(
      OtherProfileEventFetched event, Emitter<OtherProfileState> emit) async {
    try {
      if (state.status == OtherProfileStatus.loading) {
        return;
      }
      emit(state.copyWith(status: OtherProfileStatus.loading));

      final AppUser thisUser = await _queryRepository.fetchUser(event.uid);
      add(OtherProfileEventRecommendationsFetched(thisUser));
      print("\n\n\nthe user info ${thisUser.toString()}\n\n\n");

      emit(state.copyWith(status: OtherProfileStatus.success, user: thisUser));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: OtherProfileStatus.failure));
    }
  }

  Future<void> _onContentFetched(OtherProfileEventRecommendationsFetched event,
      Emitter<OtherProfileState> emit) async {
    if (state.status == OtherProfileStatus.recommendedFetched) return;
    try {
      emit(state.copyWith(
        status: OtherProfileStatus.recommendedFetched,
        recommendedContents: [],
      ));

      final contents =
          await _queryRepository.profileGetRecommends(event.user.id);
      return emit(state.copyWith(
        status: OtherProfileStatus.fetchSuccess,
        recommendedContents: contents,
      ));
    } catch (_) {
      emit(state.copyWith(status: OtherProfileStatus.failure));
    }
  }

  // FutureOr<void> _onChanged(
  //     OtherProfileEventChanged event, Emitter<OtherProfileState> emit) async {
  //   emit(const OtherProfileState.loading());

  //   emit(event.user.isNotEmpty
  //       ? OtherProfileState.success(event.user)
  //       : const OtherProfileState.failure());
  // }
  Future<List> getFollowerNames(List<String>? followers) async {
    List followerList = [];
    for (var i = 0; i < followers!.length; i++) {


      var event = await FirebaseFirestore.instance
          .collection("Person")
          .doc(followers![i])
          .get();
      if (event.exists) {
        var data = event.data()!;
        Map dummyFollower = Map();
        dummyFollower['followerName'] = AppUser.fromJson(data).name;
        dummyFollower['followerUName'] = AppUser.fromJson(data).username;
        followerList.add(dummyFollower);
      }
    }
    return followerList;
  }
  Future<List> getFollowingNames(List<String>? personList) async {
    List followingList = [];
    for (var i = 0; i < personList!.length; i++) {


      var event = await FirebaseFirestore.instance
          .collection("Person")
          .doc(personList![i])
          .get();
      if (event.exists) {
        var data = event.data()!;
        Map dummyFollower = Map();
        dummyFollower['followerName'] = AppUser.fromJson(data).name;
        dummyFollower['followerUName'] = AppUser.fromJson(data).username;
        followingList.add(dummyFollower);
      }
    }
    return followingList;
  }
  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
