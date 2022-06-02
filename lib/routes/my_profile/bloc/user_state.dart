part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

extension UserStatusX on UserStatus {
  bool get isLoadingOrSuccess => [
        UserStatus.loading,
        UserStatus.success,
      ].contains(this);
}

class UserState extends Equatable {
  final UserStatus status;
  final AppUser user;
  const UserState._(
      {this.status = UserStatus.initial, this.user = AppUser.empty});

  const UserState.initial(AppUser user)
      : this._(status: UserStatus.initial, user: user);

  const UserState.loading() : this._(status: UserStatus.loading);

  const UserState.success(AppUser user)
      : this._(status: UserStatus.success, user: user);

  const UserState.failure() : this._(status: UserStatus.failure);

  // const ProfileState.initial()
  //     : this._(status: ProfileStatus.initial, user: User.empty);

  // ProfileState copyWith({
  //   ProfileStatus? status,
  //   User? user,
  //   String? bio,
  // }) {
  //   return ProfileState(
  //     status: status ?? this.status,
  //     user: user ?? this.user,
  //   );
  // }

  @override
  List<Object> get props => [status];
}
