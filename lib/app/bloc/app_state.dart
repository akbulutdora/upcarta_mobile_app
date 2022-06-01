part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated, uninitialized, prelanded }

class AppState extends Equatable {
  final AppStatus status;
  final AppUser user;

  const AppState._({
    required this.status,
    this.user = AppUser.empty,
  });

  const AppState.uninitialized() : this._(status: AppStatus.uninitialized);

  const AppState.authenticated(AppUser user)
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
