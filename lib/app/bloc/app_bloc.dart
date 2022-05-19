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
  // StreamSubscription<AuthUser>? _userSubscription;

  @override
  AppState get initialState => const AppState.uninitialized();

  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AppState.uninitialized()) {
    on<AppStatusChanged>(_onAppStatusChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _appStatusSubscription = _authRepository.status.listen(
      (status) => add(AppStatusChanged(status)),
    );
    /* _userSubscription =
        _authRepository.user.listen((user) => add(AppUserChanged(user))); */
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

  /* void _onAppInitialized(AppStarted event, Emitter<AppState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    final isSignedIn = _authRepository.currentUser.isNotEmpty;

    try {
      emit(isSignedIn
          ? AppState.authenticated(_authRepository.currentUser)
          : const AppState.unauthenticated());
    } catch (_) {
      emit(const AppState.unauthenticated());
    }
  } */

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
    /* emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated()); */
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
    // _userSubscription?.cancel();
    return super.close();
  }

  Future<AuthUser?> _tryGetUser() async {
    try {
      final user = await _authRepository.currentUser;
      return user;
    } catch (_) {
      return null;
    }
  }
}
