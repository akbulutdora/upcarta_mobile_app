import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'latest_feed_event.dart';
part 'latest_feed_state.dart';

class LatestFeedBloc extends Bloc<LatestFeedEvent, LatestFeedState> {
  LatestFeedBloc({required this.userRepository})
      : super(const LatestFeedState()) {
    on<LatestFeedEventContentFetched>(_onContentFetched);
    on<LatestFeedEventContentRefreshed>(_onContentRefreshed);
    on<LatestFeedEventContentSaved>(_onContentSaved);
    on<LatestFeedEventContentUnsaved>(_onContentUnsaved);
    on<LatestFeedEventContentReported>(_onContentReported);
  }
  final UserRepository userRepository;

  Future<void> _onContentFetched(LatestFeedEventContentFetched event,
      Emitter<LatestFeedState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == LatestFeedStatus.initial) {
        final contents = await userRepository.fetchPosts();
        return emit(state.copyWith(
          status: LatestFeedStatus.success,
          contents: contents,
          hasReachedMax: false,
        ));
      }
      final contents =
          await userRepository.fetchPosts(numberOfPosts: state.contents.length);
      emit(contents.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: LatestFeedStatus.success,
              contents: List.of(state.contents)..addAll(contents),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: LatestFeedStatus.failure));
    }
  }

  Future<void> _onContentRefreshed(LatestFeedEventContentRefreshed event,
      Emitter<LatestFeedState> emit) async {
    emit(state.copyWith(
      status: LatestFeedStatus.initial,
      contents: [],
      hasReachedMax: false,
    ));
    try {
      if (state.status == LatestFeedStatus.initial) {
        final contents = await userRepository.fetchPosts();
        return emit(state.copyWith(
          status: LatestFeedStatus.success,
          contents: contents,
          hasReachedMax: false,
        ));
      }
      final contents =
          await userRepository.fetchPosts(numberOfPosts: state.contents.length);
      emit(contents.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: LatestFeedStatus.success,
              contents: List.of(state.contents)..addAll(contents),
              hasReachedMax: false,
            ));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(state.copyWith(status: LatestFeedStatus.failure));
    }
  }

  Future<void> _onContentSaved(
      LatestFeedEventContentSaved event, Emitter<LatestFeedState> emit) async {
    if (state.status == LatestFeedStatus.saveRequested) return;
    emit(state.copyWith(
      status: LatestFeedStatus.saveRequested,
    ));
    try {
      await userRepository.saveContent(event.contentID);
      emit(state.copyWith(
        status: LatestFeedStatus.success,
      ));
    } catch (_) {
      if (kDebugMode) {
        print('CONTENT SAVE ERROR');
      }
    }
  }

  Future<void> _onContentUnsaved(
      LatestFeedEventContentUnsaved event, Emitter<LatestFeedState> emit) async {
    if (state.status == LatestFeedStatus.unsaveRequested) return;
    emit(state.copyWith(
      status: LatestFeedStatus.unsaveRequested,
    ));
    try {
      await userRepository.unsaveContent(event.contentID);
      if (kDebugMode) {
        print(event.contentID);
      }
      emit(state.copyWith(
        status: LatestFeedStatus.success,
      ));
    } catch (_) {
      if (kDebugMode) {
        print('CONTENT UNSAVE ERROR');
      }
    }
  }

  Future<void> _onContentReported(LatestFeedEventContentReported event,
      Emitter<LatestFeedState> emit) async {
    if (state.status == LatestFeedStatus.reportRequested) return;
    emit(state.copyWith(
      status: LatestFeedStatus.reportRequested,
    ));
    try {
      await userRepository.reportContent(event.contentID);
      emit(state.copyWith(
        status: LatestFeedStatus.success,
      ));
    } catch (_) {
      if (kDebugMode) {
        print('CONTENT REPORT ERROR');
      }
    }
  }
}
