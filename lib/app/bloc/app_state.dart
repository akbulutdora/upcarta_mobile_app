part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated, uninitialized, prelanded }

class AppState extends Equatable {
  final AppStatus status;
  final User user;

  const AppState._({
  required this.status,
    this.user = User.empty,
  });

  const AppState.uninitialized() : this._(status: AppStatus.uninitialized);

  const AppState.authenticated(User user)
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
