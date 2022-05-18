part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated, initial, loading }

class AppState extends Equatable {
  final AppStatus status;
  final AuthUser user;
  const AppState._({
    required this.status,
    this.user = AuthUser.empty,
  });

  const AppState.initial() : this._(status: AppStatus.initial);
  const AppState.loading() : this._(status: AppStatus.loading);

  const AppState.authenticated(AuthUser user)
      : this._(
          status: AppStatus.authenticated,
          user: user,
        );

  const AppState.unauthenticated()
      : this._(
          status: AppStatus.unauthenticated,
        );

  @override
  List<Object> get props => [status, user];
}
