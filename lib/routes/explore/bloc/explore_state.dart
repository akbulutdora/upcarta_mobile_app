part of 'explore_cubit.dart';

enum ExploreStatus {
  initial,
  typing,
  submitting,
  success,
  error,
  followRequested,
  followSuccess
}

class ExploreState extends Equatable {
  final String searchKey;
  final ExploreStatus status;
  final List<AppUser> searchPeople;
  final String followID;

  const ExploreState({
    required this.searchKey,
    required this.status,
    this.searchPeople = const <AppUser>[],
    this.followID = "",
  });

  factory ExploreState.initial() {
    return const ExploreState(searchKey: "", status: ExploreStatus.initial);
  }

  @override
  List<Object> get props => [status, searchKey, searchPeople, followID];

  ExploreState copyWith({
    String? searchKey,
    String? followID,
    ExploreStatus? status,
    List<AppUser>? searchPeople,
  }) {
    return ExploreState(
      searchKey: searchKey ?? this.searchKey,
      followID: followID ?? this.followID,
      status: status ?? this.status,
      searchPeople: searchPeople ?? this.searchPeople,
    );
  }

  String get value => searchKey;
}
