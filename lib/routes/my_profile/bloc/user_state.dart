part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure, recommendedFetched }

// TODO: MAYBE UNNECESSARY
extension UserStatusX on UserStatus {
  bool get isLoadingOrSuccess => [
        UserStatus.loading,
        UserStatus.success,
      ].contains(this);
}

class UserState extends Equatable {
  final UserStatus status;
  final AppUser user;
  final List<Content> recommendedContents;
  const UserState({
    this.status = UserStatus.initial,
    this.user = AppUser.empty,
    this.recommendedContents = const <Content>[],
  });

  UserState copyWith({
    UserStatus? status,
    List<Content>? recommendedContents,
    AppUser? user,
  }) {
    return UserState(
      status: status ?? this.status,
      recommendedContents: recommendedContents ?? this.recommendedContents,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user, status, recommendedContents];
}
