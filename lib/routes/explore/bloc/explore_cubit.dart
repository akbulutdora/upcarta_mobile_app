import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/repositories/query_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._queryRepository, this._userRepository)
      : super(ExploreState.initial());
  final QueryRepository _queryRepository;
  final UserRepository _userRepository;

  void searchKeyChanged(String value) {
    emit(state.copyWith(searchKey: value, status: ExploreStatus.typing));
  }

  Future<void> submitSearchPerson() async {
    if (state.status == ExploreStatus.submitting) {
      return;
    }
    Timer(Duration(seconds: 1), () {});
    emit(state.copyWith(status: ExploreStatus.submitting));
    try {
      var searchPersons = await _queryRepository.fetchSearch(state.searchKey);
      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(
          status: ExploreStatus.success, searchPeople: searchPersons));
    } catch (_) {}
  }

  Future<void> followRequested(String followID) async {
    if (state.status == ExploreStatus.followRequested) {
      return;
    }
    emit(state.copyWith(
        status: ExploreStatus.followRequested, followID: followID));

    try {
      await _userRepository.followUserWithID(followID);
      await Future.delayed(const Duration(seconds: 4));
      emit(state.copyWith(status: ExploreStatus.followSuccess));
    } catch (_) {}
  }

  Future<void> unfollowRequested(String followID) async {
    if (state.status == ExploreStatus.followRequested) {
      return;
    }
    emit(state.copyWith(
        status: ExploreStatus.followRequested, followID: followID));

    try {
      await _userRepository.unfollowUserWithID(followID);
      emit(state.copyWith(status: ExploreStatus.followSuccess));
    } catch (_) {}
  }
}
