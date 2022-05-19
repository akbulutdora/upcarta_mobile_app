import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/auth_user.dart';
import 'package:upcarta_mobile_app/repositories/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  late StreamSubscription<AppStatus> _appStatusSubscription;
  StreamSubscription<AuthUser>? _userSubscription;

  @override
  AppState get initialState => const AppState.uninitialized();

  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AppState.uninitialized()) {
    on<AppStatusChanged>(_onAppStatusChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppUserChanged>(_onAppUserChanged);
    _appStatusSubscription = _authRepository.status.listen(
      (status) => add(AppStatusChanged(status)),
    );
    _userSubscription =
        _authRepository.user.listen((user) => add(AppUserChanged(user)));
  }

  // AppBloc({required AuthRepository authRepository})
  //     : _authRepository = authRepository,
  //       super(authRepository.currentUser.isNotEmpty
  //           ? AppState.authenticated(authRepository.currentUser)
  //           : const AppState.unauthenticated()) {
  //   on<NavigateToHomeScreenEvent>(_onAppInitialized);
  //   on<AppUserChanged>(_onUserChanged);
  //   on<AppLogoutRequested>(_onLogoutRequested);
  //   _userSubscription =
  //       _authRepository.user.listen((user) => add(AppUserChanged(user)));
  // }

  FutureOr<void> _onAppUserChanged(
      AppUserChanged event, Emitter<AppState> emit) async {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated());
  }

  void _onAppStatusChanged(
    AppStatusChanged event,
    Emitter<AppState> emit,
  ) async {
    switch (event.status) {
      case AppStatus.unauthenticated:
        return emit(const AppState.unauthenticated());
      case AppStatus.authenticated:
        final user = await _tryGetUser();
        return emit(user != null
            ? AppState.authenticated(user)
            : const AppState.unauthenticated());
      default:
        return emit(const AppState.uninitialized());
    }
  }

  void _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) {
    unawaited(_authRepository.logOut());
  }

  @override
  Future<void> close() {
    _appStatusSubscription.cancel();
    _authRepository.dispose();
    _userSubscription?.cancel();
    return super.close();
  }

  Future<AuthUser?> _tryGetUser() async {
    try {
      final user = await _authRepository.currentUser;
      print("INSIDE APPBLOC" + user.email!);
      return user;
    } catch (_) {
      return null;
    }
  }
}
