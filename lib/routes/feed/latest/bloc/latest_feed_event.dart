part of 'latest_feed_bloc.dart';

abstract class LatestFeedEvent extends Equatable {
  const LatestFeedEvent();

  @override
  List<Object> get props => [];
}

class LatestFeedEventContentFetched extends LatestFeedEvent {}

class LatestFeedEventContentRefreshed extends LatestFeedEvent {}
