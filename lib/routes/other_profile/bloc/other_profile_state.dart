part of 'other_profile_bloc.dart';

enum OtherProfileStatus { initial, loading, success, failure }

extension OtherProfileStatusX on OtherProfileStatus {
  bool get isLoadingOrSuccess => [
        OtherProfileStatus.loading,
        OtherProfileStatus.success,
      ].contains(this);
}

class OtherProfileState extends Equatable {
  final OtherProfileStatus status;
  final AppUser user;
  const OtherProfileState._(
      {this.status = OtherProfileStatus.initial, this.user = AppUser.empty});

  const OtherProfileState.initial(AppUser user)
      : this._(status: OtherProfileStatus.initial, user: user);

  const OtherProfileState.loading()
      : this._(status: OtherProfileStatus.loading);

  const OtherProfileState.success(AppUser user)
      : this._(status: OtherProfileStatus.success, user: user);

  const OtherProfileState.failure()
      : this._(status: OtherProfileStatus.failure);

  // const ProfileState.initial()
  //     : this._(status: ProfileStatus.initial, user: User.empty);

  // OtherProfileState copyWith({
  //   OtherProfileState? status,
  //   AppUser? user,
  // }) {
  //   return OtherProfileState(
  //     status: status ?? this.status,
  //     user: user ?? this.user,
  //   );
  // }

  @override
  List<Object> get props => [status];
}
