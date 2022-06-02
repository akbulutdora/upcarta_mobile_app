part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// class ProfileEventBioChanged extends ProfileEvent {
//   const ProfileEventBioChanged(this.bio);

//   final String bio;

//   @override
//   List<Object> get props => [bio];
// }

class UserEventChanged extends UserEvent {
  const UserEventChanged(this.user);
  final AppUser user;
  @override
  List<Object> get props => [user];
}

class UserEventAuthChanged extends UserEvent {
  const UserEventAuthChanged(this.user);
  final AppUser user;
  @override
  List<Object> get props => [user];
}

class UserEventSubmitted extends UserEvent {
  const UserEventSubmitted(this.user);

  final AppUser user;

  @override
  List<Object> get props => [user];
}

class UserEventRecommendationsFetched extends UserEvent {
  const UserEventRecommendationsFetched(this.userID);

  final String userID;

  @override
  List<Object> get props => [userID];
}
