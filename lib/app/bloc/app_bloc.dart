import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:upcarta_mobile_app/models/auth_user.dart';
// import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationRepository _authRepository;
  final SharedPreferences _sharedPrefs;
  late final StreamSubscription<User>? _userSubscription;

  AppState get initialState => const AppState.uninitialized();

  AppBloc(
      {required AuthenticationRepository authRepository,
      required SharedPreferences sharedPrefs})
      : _authRepository = authRepository,
        _sharedPrefs = sharedPrefs,
        super(const AppState.uninitialized()) {
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppUserChanged>(_onAppUserChanged);
    on<AppLanded>(_onLanded);
    on<AppLandedCanceled>(_onLandedCanceled);

    _userSubscription =
        _authRepository.user.listen((user) => add(AppUserChanged(user)));
  }

  FutureOr<void> _onAppUserChanged(
      AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : _sharedPrefs.getBool("landed") == null ||
                !_sharedPrefs.getBool("landed")!
            ? const AppState.prelanded()
            : const AppState.unauthenticated());
  }

  void _onLanded(
    AppLanded event,
    Emitter<AppState> emit,
  ) {
    _sharedPrefs.setBool(("landed"), true);
    emit(const AppState.unauthenticated());
  }

  void _onLandedCanceled(
    AppLandedCanceled event,
    Emitter<AppState> emit,
  ) {
    _sharedPrefs.setBool(("landed"), false);
    emit(const AppState.prelanded());
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
