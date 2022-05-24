part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppStatusChanged extends AppEvent {
  const AppStatusChanged(this.status);
  final AppStatus status;

  @override
  List<Object> get props => [status];
}

class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);
  final AuthUser user;

  @override
  List<Object> get props => [user];
}

// class AppLanded extends AppEvent {
//   const AppLanded(this.status);
//   final AppStatus status;

//   @override
//   List<Object> get props => [status];
// }
