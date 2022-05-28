part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

// class ProfileEventBioChanged extends ProfileEvent {
//   const ProfileEventBioChanged(this.bio);

//   final String bio;

//   @override
//   List<Object> get props => [bio];
// }

class ProfileEventChanged extends ProfileEvent {
  const ProfileEventChanged(this.user);
  final User user;
  @override
  List<Object> get props => [user];
}

class ProfileEventAuthChanged extends ProfileEvent {
  const ProfileEventAuthChanged(this.user);
  final User user;
  @override
  List<Object> get props => [user];
}

class ProfileEventSubmitted extends ProfileEvent {
  const ProfileEventSubmitted(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
