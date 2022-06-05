part of 'other_profile_bloc.dart';

enum OtherProfileStatus {
  initial,
  loading,
  success,
  failure,
  recommendedFetched,
  fetchSuccess
}

// TODO: MAYBE UNNECESSARY
extension OtherProfileStatusX on OtherProfileStatus {
  bool get isLoadingOrSuccess => [
        OtherProfileStatus.loading,
        OtherProfileStatus.success,
      ].contains(this);
}

class OtherProfileState extends Equatable {
  final OtherProfileStatus status;
  final AppUser user;
  final List<Content> recommendedContents;
  const OtherProfileState(
      {this.status = OtherProfileStatus.initial,
      this.user = AppUser.empty,
      this.recommendedContents = const <Content>[]});

  OtherProfileState copyWith({
    OtherProfileStatus? status,
    AppUser? user,
    List<Content>? recommendedContents,
  }) {
    return OtherProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      recommendedContents: recommendedContents ?? this.recommendedContents,
    );
  }

  @override
  List<Object> get props => [user, status, recommendedContents];
}
