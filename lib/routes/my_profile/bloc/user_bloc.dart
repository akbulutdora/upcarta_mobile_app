import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final StreamSubscription<AppUser>? _userSubscription;
  late final StreamSubscription<AppUser>? _authSubscription;
  final UserRepository _userRepository;
  final AuthenticationRepository _authRepository;

  UserBloc({
    required UserRepository userRepository,
    required AuthenticationRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        super(const UserState.initial(AppUser.empty)) {
    on<UserEventChanged>(_onChanged);
    on<UserEventAuthChanged>(_onAuthChanged);

    // TODO: SUBSCRIPTION GEREKLİ Mİ?
    _userSubscription =
        _userRepository.user.listen((user) => add(UserEventChanged(
              user,
            )));
    _authSubscription =
        _authRepository.user.listen((user) => add(UserEventAuthChanged(user)));
  }

  // FutureOr<void> _onBioChanged(
  //     ProfileEventBioChanged event, Emitter<ProfileState> emit) {
  //   emit(state.copyWith(bio: event.bio));
  // }

  FutureOr<void> _onChanged(
      UserEventChanged event, Emitter<UserState> emit) async {
    print("\n\n\nprinting user in profile bloc ${event.user}");
    emit(const UserState.loading());

    //User user = await _userRepository.getCurrentUser();

    // emit(ProfileState.success(user));
    emit(event.user.isNotEmpty
        ? UserState.success(event.user)
        : const UserState.failure());
  }

  FutureOr<void> _onAuthChanged(
      UserEventAuthChanged event, Emitter<UserState> emit) async {
    print("\n\n\nprinting user in profile bloc ${event.user}");
    emit(const UserState.loading());

    AppUser user = await _userRepository.getCurrentUser();

    emit(UserState.success(user));
    // emit(event.user.isNotEmpty
    //     ? ProfileState.success(event.user)
    //     : const ProfileState.failure());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _authSubscription?.cancel();
    return super.close();
  }
}
