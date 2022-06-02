part of 'latest_feed_bloc.dart';

abstract class LatestFeedEvent extends Equatable {
  const LatestFeedEvent();

  @override
  List<Object> get props => [];
}

class LatestFeedEventContentFetched extends LatestFeedEvent {}

class LatestFeedEventContentRefreshed extends LatestFeedEvent {}

class LatestFeedEventContentSaved extends LatestFeedEvent {
  const LatestFeedEventContentSaved(this.contentID);

  final String contentID;

  @override
  List<Object> get props => [contentID];
}

class LatestFeedEventContentReported extends LatestFeedEvent {
  const LatestFeedEventContentReported(this.contentID);

  final String contentID;

  @override
  List<Object> get props => [contentID];
}
