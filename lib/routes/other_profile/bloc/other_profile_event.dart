part of 'other_profile_bloc.dart';

abstract class OtherProfileEvent extends Equatable {
  const OtherProfileEvent();

  @override
  List<Object> get props => [];
}

// class ProfileEventBioChanged extends ProfileEvent {
//   const ProfileEventBioChanged(this.bio);

//   final String bio;

//   @override
//   List<Object> get props => [bio];
// }

class OtherProfileEventChanged extends OtherProfileEvent {
  const OtherProfileEventChanged(this.user);
  final AppUser user;
  @override
  List<Object> get props => [user];
}

class OtherProfileEventFetched extends OtherProfileEvent {
  const OtherProfileEventFetched(this.uid);
  final String uid;
  @override
  List<Object> get props => [uid];
}

class OtherProfileEventSubmitted extends OtherProfileEvent {
  const OtherProfileEventSubmitted(this.user);

  final AppUser user;

  @override
  List<Object> get props => [user];
}

class OtherProfileEventRecommendationsFetched extends OtherProfileEvent {
  const OtherProfileEventRecommendationsFetched(this.user);

  final AppUser user;
  @override
  List<Object> get props => [user];
}
