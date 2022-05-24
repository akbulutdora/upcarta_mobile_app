part of 'app_bloc.dart';

class AppState extends Equatable {
  final AppStatus status;
  final AuthUser user;

  const AppState._({
    this.status = AppStatus.uninitialized,
    this.user = AuthUser.empty,
  });

  const AppState.uninitialized() : this._(status: AppStatus.uninitialized);

  const AppState.authenticated(AuthUser user)
      : this._(
          status: AppStatus.authenticated,
          user: user,
        );

  const AppState.unauthenticated()
      : this._(
          status: AppStatus.unauthenticated,
        );
  const AppState.prelanded()
      : this._(
          status: AppStatus.prelanded,
        );

  @override
  List<Object> get props => [status, user];
}
