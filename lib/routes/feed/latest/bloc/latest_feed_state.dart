part of 'latest_feed_bloc.dart';

enum LatestFeedStatus {
  initial,
  success,
  failure,
  saveRequested,
  unsaveRequested,
  reportRequested
}

class LatestFeedState extends Equatable {
  const LatestFeedState({
    this.status = LatestFeedStatus.initial,
    this.contents = const <Content>[],
    this.hasReachedMax = false,
  });

  final LatestFeedStatus status;
  final List<Content> contents;
  final bool hasReachedMax;

  LatestFeedState copyWith({
    LatestFeedStatus? status,
    List<Content>? contents,
    bool? hasReachedMax,
  }) {
    return LatestFeedState(
      status: status ?? this.status,
      contents: contents ?? this.contents,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''LatestFeedState { status: $status, hasReachedMax: $hasReachedMax, posts: ${contents.length} }''';
  }

  @override
  List<Object> get props => [status, contents, hasReachedMax];
}
