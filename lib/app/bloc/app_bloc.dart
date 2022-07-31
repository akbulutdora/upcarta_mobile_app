import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/analytics_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository/user_repository.dart';
import '../../models/entity/upcarta_user.dart';

//import 'package:upcarta_mobile_app/models/user.dart';
//import 'package:upcarta_mobile_app/models/auth_user.dart';
//import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationRepository _authRepository;
  //final AnalyticsRepository _analyticsRepository;
  final SharedPreferences _sharedPrefs;
  final UserRepository _userRepository;
  late final StreamSubscription<AuthenticationStatus>? _authSubscription;
  //ProfileBloc _profileBloc;

  AppState get initialState => const AppState.uninitialized();

  AppBloc({
    required AuthenticationRepository authRepository,
    required AnalyticsRepository analyticsRepository,
    required SharedPreferences sharedPrefs,
    required UserRepository userRepository,
    //required ProfileBloc profileBloc
  })  : _authRepository = authRepository,
        _sharedPrefs = sharedPrefs,
        _userRepository = userRepository,
        //_analyticsRepository = analyticsRepository,
        //_profileBloc = profileBloc,
        super(
              authRepository.appUser.isNotEmpty
              ? AppState.authenticated(authRepository.appUser)
              : const AppState.uninitialized()) {
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AppLanded>(_onLanded);
    on<AppLandedCanceled>(_onLandedCanceled);


    _authSubscription = _authRepository.status.listen((status) {
      add(AuthenticationStatusChanged(status));
      // _profileBloc.add(ProfileEventChanged(user));
    });

  }

  FutureOr<void> _onAuthenticationStatusChanged(
      AuthenticationStatusChanged event, Emitter<AppState> emit) async {
    final user = await _tryGetUser();
    if( user == null || !user.isNotEmpty ){
      return emit( _sharedPrefs.getBool('landed') == null ||
          !_sharedPrefs.getBool('landed')!
          ? const AppState.prelanded()
          : const AppState.unauthenticated());
    }
    switch (event.status){
      case AuthenticationStatus.unauthenticated:
        return emit(const AppState.unauthenticated());
      case AuthenticationStatus.authenticated:
        return emit(AppState.authenticated(user));
      default:
        return emit(const AppState.uninitialized());
    }

    /* //Analytics for firebase, obsolete
    if (event.user.email != '') {
      _analyticsRepository.setUserId(event.user.email!);
      _analyticsRepository.setDefaultEventParameters(event.user.email!);
      _analyticsRepository.setLogEvent('signed_in');
    }
    */
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
    _authSubscription?.cancel();
    _authRepository.dispose();
    return super.close();
  }

  Future<User?> _tryGetUser() async{
    try{
      final user = await _userRepository.getUser();
      return user as User?;
    } catch (_){
      return null;
    }
  }
}
