part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AuthenticationStatusChanged extends AppEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AppLanded extends AppEvent {}

class AppLandedCanceled extends AppEvent {}
