import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/auth_user.dart';
import 'package:upcarta_mobile_app/repositories/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  StreamSubscription<AuthUser>? _userSubscription;

  AppState get initialState => const AppState.initial();

  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AppState.initial()) {
    on<NavigateToHomeScreenEvent>(_onAppInitialized);
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
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

  void _onAppInitialized(
      NavigateToHomeScreenEvent event, Emitter<AppState> emit) async {
    emit(const AppState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(_authRepository.currentUser.isNotEmpty
        ? AppState.authenticated(_authRepository.currentUser)
        : const AppState.unauthenticated());
  }

  void _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated());
  }

  void _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) {
    unawaited(_authRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
