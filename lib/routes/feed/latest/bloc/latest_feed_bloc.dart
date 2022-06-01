import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'latest_feed_event.dart';
part 'latest_feed_state.dart';

class LatestFeedBloc extends Bloc<LatestFeedEvent, LatestFeedState> {
  LatestFeedBloc({required this.userRepository})
      : super(const LatestFeedState()) {
    on<LatestFeedEventContentFetched>(_onContentFetched);
    on<LatestFeedEventContentRefreshed>(_onContentRefreshed);
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
    } catch (_) {
      emit(state.copyWith(status: LatestFeedStatus.failure));
    }
  }
}
