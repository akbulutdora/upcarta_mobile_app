part of 'explore_cubit.dart';

enum ExploreStatus { initial, typing, submitting, success, error }

class ExploreState extends Equatable {
  final String searchKey;
  final ExploreStatus status;

  const ExploreState({
    required this.searchKey,
    required this.status,
  });

  factory ExploreState.initial() {
    return const ExploreState(searchKey: "", status: ExploreStatus.initial);
  }

  @override
  List<Object> get props => [status, searchKey];

  ExploreState copyWith({
    String? searchKey,
    ExploreStatus? status,
  }) {
    return ExploreState(
      searchKey: searchKey ?? this.searchKey,
      status: status ?? this.status,
    );
  }

  String get value => searchKey;
}
