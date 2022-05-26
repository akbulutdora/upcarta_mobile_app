part of 'user_cubit.dart';

/// THIS CUBIT IS FOR USER ACTIONS SUCH AS FOLLOW, UNFOLLOW, SAVE, RECOMMEND,
/// EDIT PROFILE
// TODO: DECIDE WHICH STATUS THE USER CAN HAVE
enum UserStatus { initial }

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}
