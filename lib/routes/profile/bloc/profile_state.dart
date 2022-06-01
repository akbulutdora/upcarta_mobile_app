part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

extension ProfileStatusX on ProfileStatus {
  bool get isLoadingOrSuccess => [
        ProfileStatus.loading,
        ProfileStatus.success,
      ].contains(this);
}

class ProfileState extends Equatable {
  final ProfileStatus status;
  final AppUser user;
  const ProfileState._(
      {this.status = ProfileStatus.initial, this.user = AppUser.empty});

  const ProfileState.initial(AppUser user)
      : this._(status: ProfileStatus.initial, user: user);

  const ProfileState.loading() : this._(status: ProfileStatus.loading);

  const ProfileState.success(AppUser user)
      : this._(status: ProfileStatus.success, user: user);

  const ProfileState.failure() : this._(status: ProfileStatus.failure);

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
