part of 'app_bloc.dart';

//This was changed to AuthenticationStatus, found in auth repository
//The states are same, however
//enum AppStatus { authenticated, unauthenticated, uninitialized, prelanded }

class AppState extends Equatable {
  final AuthenticationStatus status;
  final User user;

  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.uninitialized() : this._(status: AuthenticationStatus.uninitialized);

  const AppState.authenticated(User user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );

  const AppState.unauthenticated()
      : this._(
          status: AuthenticationStatus.unauthenticated,
        );
  const AppState.prelanded()
      : this._(
          status: AuthenticationStatus.prelanded,
        );

  @override
  List<Object> get props => [status, user];
}
