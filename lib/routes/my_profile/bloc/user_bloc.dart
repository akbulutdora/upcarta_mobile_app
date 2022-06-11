import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/models/user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final StreamSubscription<AppUser>? _userSubscription;
  late final StreamSubscription<AppUser>? _authSubscription;
  final UserRepository _userRepository;
  final AuthenticationRepository _authRepository;

  UserBloc({
    required UserRepository userRepository,
    required AuthenticationRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        super(const UserState()) {
    on<UserEventChanged>(_onChanged);
    on<UserEventAuthChanged>(_onAuthChanged);
    on<UserEventRecommendationsFetched>(_onContentFetched);

    // TODO: SUBSCRIPTION GEREKLİ Mİ?
    _userSubscription = _userRepository.user.listen((user) {
      add(UserEventChanged(
        user,
      ));
      add(const UserEventRecommendationsFetched());
    });
    _authSubscription = _authRepository.user.listen((user) {
      add(const UserEventAuthChanged());
      if (user.recommendationsID != null) {
        add(const UserEventRecommendationsFetched());
      }
    });
  }

  FutureOr<void> _onChanged(
      UserEventChanged event, Emitter<UserState> emit) async {
    print("\n\n\nprinting user in profile bloc ${event.user}");
    emit(state.copyWith(status: UserStatus.loading));

    AppUser user = await _userRepository.getCurrentUser();
    emit(event.user.isNotEmpty
        ? state.copyWith(status: UserStatus.success, user: user)
        : state.copyWith(status: UserStatus.failure));
  }

  FutureOr<void> _onAuthChanged(
      UserEventAuthChanged event, Emitter<UserState> emit) async {
    // print("\n\n\nprinting user in profile bloc ${event.user}");
    emit(state.copyWith(status: UserStatus.loading));

    AppUser user = await _userRepository.getCurrentUser();

    emit(state.copyWith(status: UserStatus.success, user: user));
    // emit(event.user.isNotEmpty
    //     ? ProfileState.success(event.user)
    //     : const ProfileState.failure());
  }

  Future<void> _onContentFetched(
      UserEventRecommendationsFetched event, Emitter<UserState> emit) async {
    if (state.status == UserStatus.recommendedFetched) return;
    try {
      emit(state.copyWith(
        status: UserStatus.recommendedFetched,
        recommendedContents: [],
      ));

      final contents =
      await _userRepository.profileGetRecommends(state.user.id);
      return emit(state.copyWith(
        status: UserStatus.success,
        recommendedContents: contents,
      ));
    } catch (_) {
      emit(state.copyWith(status: UserStatus.failure));
    }
  }
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
    _authSubscription?.cancel();
    return super.close();
  }
}