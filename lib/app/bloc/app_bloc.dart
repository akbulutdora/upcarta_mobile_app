import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/models/user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/analytics_repository.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationRepository _authRepository;
  final AnalyticsRepository _analyticsRepository;
  final SharedPreferences _sharedPrefs;
  late final StreamSubscription<AppUser>? _userSubscription;
  // ProfileBloc _profileBloc;

  AppState get initialState => const AppState.uninitialized();

  AppBloc({
    required AuthenticationRepository authRepository,
    required AnalyticsRepository analyticsRepository,
    required SharedPreferences sharedPrefs,
    // required ProfileBloc profileBloc
  })  : _authRepository = authRepository,
        _analyticsRepository = analyticsRepository,
        _sharedPrefs = sharedPrefs,
        // _profileBloc = profileBloc,
        super(const AppState.uninitialized()) {
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppUserChanged>(_onAppUserChanged);
    on<AppLanded>(_onLanded);
    on<AppLandedCanceled>(_onLandedCanceled);

    _userSubscription = _authRepository.user.listen((user) {
      add(AppUserChanged(user));
      // _profileBloc.add(ProfileEventChanged(user));
    });
  }

  FutureOr<void> _onAppUserChanged(
      AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : _sharedPrefs.getBool('landed') == null ||
                !_sharedPrefs.getBool('landed')!
            ? const AppState.prelanded()
            : const AppState.unauthenticated());
    if (event.user.email != null) {
      _analyticsRepository.setUserId(event.user.email!);
      _analyticsRepository.setDefaultEventParameters(event.user.email!);
      _analyticsRepository.setLogEvent('signed_in');
    }
  }

  void _onLanded(
    AppLanded event,
    Emitter<AppState> emit,
  ) {
    _sharedPrefs.setBool('landed', true);
    emit(const AppState.unauthenticated());
  }

  void _onLandedCanceled(
    AppLandedCanceled event,
    Emitter<AppState> emit,
  ) {
    _sharedPrefs.setBool('landed', false);
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
