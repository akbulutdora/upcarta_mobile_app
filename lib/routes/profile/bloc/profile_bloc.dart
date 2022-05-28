import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late final StreamSubscription<User>? _userSubscription;
  late final StreamSubscription<User>? _authSubscription;
  final UserRepository _userRepository;
  final AuthenticationRepository _authRepository;

  ProfileBloc({
    required UserRepository userRepository,
    required AuthenticationRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        super(const ProfileState.initial(User.empty)) {
    on<ProfileEventChanged>(_onChanged);
    on<ProfileEventAuthChanged>(_onAuthChanged);

    // TODO: SUBSCRIPTION GEREKLİ Mİ?
    _userSubscription =
        _userRepository.user.listen((user) => add(ProfileEventChanged(user)));
    _authSubscription = _authRepository.user
        .listen((user) => add(ProfileEventAuthChanged(user)));
  }

  // FutureOr<void> _onBioChanged(
  //     ProfileEventBioChanged event, Emitter<ProfileState> emit) {
  //   emit(state.copyWith(bio: event.bio));
  // }

  FutureOr<void> _onChanged(
      ProfileEventChanged event, Emitter<ProfileState> emit) async {
    print("\n\n\nprinting user in profile bloc ${event.user}");
    emit(const ProfileState.loading());

    //User user = await _userRepository.getCurrentUser();

    // emit(ProfileState.success(user));
    emit(event.user.isNotEmpty
        ? ProfileState.success(event.user)
        : const ProfileState.failure());
  }

  FutureOr<void> _onAuthChanged(
      ProfileEventAuthChanged event, Emitter<ProfileState> emit) async {
    print("\n\n\nprinting user in profile bloc ${event.user}");
    emit(const ProfileState.loading());

    User user = await _userRepository.getCurrentUser();

    emit(ProfileState.success(user));
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
